-- Copyright (C) 2021  Intel Corporation. All rights reserved.
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
-- VERSION "Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"

-- DATE "05/06/2022 00:34:19"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sumador IS
    PORT (
	a : IN std_logic_vector(7 DOWNTO 0);
	b : IN std_logic_vector(7 DOWNTO 0);
	D1 : OUT std_logic_vector(6 DOWNTO 0);
	D2 : OUT std_logic_vector(6 DOWNTO 0);
	D3 : OUT std_logic_vector(6 DOWNTO 0);
	D4 : OUT std_logic_vector(6 DOWNTO 0);
	D5 : OUT std_logic_vector(6 DOWNTO 0);
	datos : OUT std_logic_vector(7 DOWNTO 0);
	clr : IN std_logic;
	clk : IN std_logic;
	confirm : IN std_logic;
	E : OUT std_logic;
	RS : OUT std_logic;
	RW : OUT std_logic
	);
END sumador;

-- Design Ports Information
-- D1[0]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1[1]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1[2]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1[3]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1[4]	=>  Location: PIN_J5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1[5]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1[6]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[0]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[1]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[2]	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[3]	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[4]	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[5]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[6]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[0]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[1]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[2]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[3]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[4]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[5]	=>  Location: PIN_R28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[6]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[0]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[1]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[2]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[3]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[4]	=>  Location: PIN_M3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[5]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[6]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[0]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[1]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[2]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[3]	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[4]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[5]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[6]	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datos[0]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datos[1]	=>  Location: PIN_K4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datos[2]	=>  Location: PIN_H3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datos[3]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datos[4]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datos[5]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datos[6]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datos[7]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RS	=>  Location: PIN_J4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RW	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_J28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_J27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[4]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[5]	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[6]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[7]	=>  Location: PIN_K3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[4]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[5]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[6]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[7]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- confirm	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clr	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF sumador IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_D1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_D2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_D3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_D4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_D5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_datos : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_clr : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_confirm : std_logic;
SIGNAL ww_E : std_logic;
SIGNAL ww_RS : std_logic;
SIGNAL ww_RW : std_logic;
SIGNAL \confirm~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_dly~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clr~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \D1[0]~output_o\ : std_logic;
SIGNAL \D1[1]~output_o\ : std_logic;
SIGNAL \D1[2]~output_o\ : std_logic;
SIGNAL \D1[3]~output_o\ : std_logic;
SIGNAL \D1[4]~output_o\ : std_logic;
SIGNAL \D1[5]~output_o\ : std_logic;
SIGNAL \D1[6]~output_o\ : std_logic;
SIGNAL \D2[0]~output_o\ : std_logic;
SIGNAL \D2[1]~output_o\ : std_logic;
SIGNAL \D2[2]~output_o\ : std_logic;
SIGNAL \D2[3]~output_o\ : std_logic;
SIGNAL \D2[4]~output_o\ : std_logic;
SIGNAL \D2[5]~output_o\ : std_logic;
SIGNAL \D2[6]~output_o\ : std_logic;
SIGNAL \D3[0]~output_o\ : std_logic;
SIGNAL \D3[1]~output_o\ : std_logic;
SIGNAL \D3[2]~output_o\ : std_logic;
SIGNAL \D3[3]~output_o\ : std_logic;
SIGNAL \D3[4]~output_o\ : std_logic;
SIGNAL \D3[5]~output_o\ : std_logic;
SIGNAL \D3[6]~output_o\ : std_logic;
SIGNAL \D4[0]~output_o\ : std_logic;
SIGNAL \D4[1]~output_o\ : std_logic;
SIGNAL \D4[2]~output_o\ : std_logic;
SIGNAL \D4[3]~output_o\ : std_logic;
SIGNAL \D4[4]~output_o\ : std_logic;
SIGNAL \D4[5]~output_o\ : std_logic;
SIGNAL \D4[6]~output_o\ : std_logic;
SIGNAL \D5[0]~output_o\ : std_logic;
SIGNAL \D5[1]~output_o\ : std_logic;
SIGNAL \D5[2]~output_o\ : std_logic;
SIGNAL \D5[3]~output_o\ : std_logic;
SIGNAL \D5[4]~output_o\ : std_logic;
SIGNAL \D5[5]~output_o\ : std_logic;
SIGNAL \D5[6]~output_o\ : std_logic;
SIGNAL \datos[0]~output_o\ : std_logic;
SIGNAL \datos[1]~output_o\ : std_logic;
SIGNAL \datos[2]~output_o\ : std_logic;
SIGNAL \datos[3]~output_o\ : std_logic;
SIGNAL \datos[4]~output_o\ : std_logic;
SIGNAL \datos[5]~output_o\ : std_logic;
SIGNAL \datos[6]~output_o\ : std_logic;
SIGNAL \datos[7]~output_o\ : std_logic;
SIGNAL \E~output_o\ : std_logic;
SIGNAL \RS~output_o\ : std_logic;
SIGNAL \RW~output_o\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \a[7]~input_o\ : std_logic;
SIGNAL \a[5]~input_o\ : std_logic;
SIGNAL \a[4]~input_o\ : std_logic;
SIGNAL \a[6]~input_o\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \Mux20~0_combout\ : std_logic;
SIGNAL \Mux19~0_combout\ : std_logic;
SIGNAL \Mux18~0_combout\ : std_logic;
SIGNAL \Mux17~0_combout\ : std_logic;
SIGNAL \Mux16~0_combout\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \Mux14~0_combout\ : std_logic;
SIGNAL \b[4]~input_o\ : std_logic;
SIGNAL \b[7]~input_o\ : std_logic;
SIGNAL \b[6]~input_o\ : std_logic;
SIGNAL \b[5]~input_o\ : std_logic;
SIGNAL \Mux27~0_combout\ : std_logic;
SIGNAL \Mux26~0_combout\ : std_logic;
SIGNAL \Mux25~0_combout\ : std_logic;
SIGNAL \Mux24~0_combout\ : std_logic;
SIGNAL \Mux23~0_combout\ : std_logic;
SIGNAL \Mux22~0_combout\ : std_logic;
SIGNAL \Mux21~0_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \clr~input_o\ : std_logic;
SIGNAL \count_dly[0]~14_combout\ : std_logic;
SIGNAL \count_dly[0]~15\ : std_logic;
SIGNAL \count_dly[1]~16_combout\ : std_logic;
SIGNAL \count_dly[1]~17\ : std_logic;
SIGNAL \count_dly[2]~18_combout\ : std_logic;
SIGNAL \count_dly[2]~19\ : std_logic;
SIGNAL \count_dly[3]~20_combout\ : std_logic;
SIGNAL \count_dly[3]~21\ : std_logic;
SIGNAL \count_dly[4]~22_combout\ : std_logic;
SIGNAL \count_dly[4]~23\ : std_logic;
SIGNAL \count_dly[5]~24_combout\ : std_logic;
SIGNAL \count_dly[5]~25\ : std_logic;
SIGNAL \count_dly[6]~26_combout\ : std_logic;
SIGNAL \count_dly[6]~27\ : std_logic;
SIGNAL \count_dly[7]~28_combout\ : std_logic;
SIGNAL \count_dly[7]~29\ : std_logic;
SIGNAL \count_dly[8]~30_combout\ : std_logic;
SIGNAL \count_dly[8]~31\ : std_logic;
SIGNAL \count_dly[9]~32_combout\ : std_logic;
SIGNAL \count_dly[9]~33\ : std_logic;
SIGNAL \count_dly[10]~34_combout\ : std_logic;
SIGNAL \count_dly[10]~35\ : std_logic;
SIGNAL \count_dly[11]~36_combout\ : std_logic;
SIGNAL \count_dly[11]~37\ : std_logic;
SIGNAL \count_dly[12]~38_combout\ : std_logic;
SIGNAL \count_dly[12]~39\ : std_logic;
SIGNAL \count_dly[13]~40_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \LessThan3~2_combout\ : std_logic;
SIGNAL \clk_dly~0_combout\ : std_logic;
SIGNAL \clk_dly~feeder_combout\ : std_logic;
SIGNAL \clk_dly~q\ : std_logic;
SIGNAL \clk_dly~clkctrl_outclk\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \WideOr9~0_combout\ : std_logic;
SIGNAL \LCD:contador2[0]~0_combout\ : std_logic;
SIGNAL \LCD:contador2[0]~q\ : std_logic;
SIGNAL \LCD:contador2[2]~0_combout\ : std_logic;
SIGNAL \LCD:contador2[1]~0_combout\ : std_logic;
SIGNAL \LCD:contador2[1]~q\ : std_logic;
SIGNAL \LCD:contador2[2]~1_combout\ : std_logic;
SIGNAL \LCD:contador2[2]~2_combout\ : std_logic;
SIGNAL \LCD:contador2[2]~q\ : std_logic;
SIGNAL \LCD:contador2[3]~0_combout\ : std_logic;
SIGNAL \LCD:contador2[3]~q\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LCD:numMen~0_combout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \Selector21~1_combout\ : std_logic;
SIGNAL \confirm~input_o\ : std_logic;
SIGNAL \Selector24~2_combout\ : std_logic;
SIGNAL \Selector22~0_combout\ : std_logic;
SIGNAL \Selector26~0_combout\ : std_logic;
SIGNAL \Selector26~1_combout\ : std_logic;
SIGNAL \next_state.L2~feeder_combout\ : std_logic;
SIGNAL \next_state.L2~q\ : std_logic;
SIGNAL \clr~inputclkctrl_outclk\ : std_logic;
SIGNAL \current_state.L2~q\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \Selector16~1_combout\ : std_logic;
SIGNAL \Selector16~2_combout\ : std_logic;
SIGNAL \Selector16~3_combout\ : std_logic;
SIGNAL \next_state.D_OFF~q\ : std_logic;
SIGNAL \current_state.D_OFF~q\ : std_logic;
SIGNAL \Selector23~0_combout\ : std_logic;
SIGNAL \E~3_combout\ : std_logic;
SIGNAL \Selector24~4_combout\ : std_logic;
SIGNAL \Selector24~3_combout\ : std_logic;
SIGNAL \next_state.ASK3~q\ : std_logic;
SIGNAL \current_state.ASK3~q\ : std_logic;
SIGNAL \Selector7~4_combout\ : std_logic;
SIGNAL \Selector17~1_combout\ : std_logic;
SIGNAL \Selector17~2_combout\ : std_logic;
SIGNAL \Selector17~3_combout\ : std_logic;
SIGNAL \Selector17~4_combout\ : std_logic;
SIGNAL \next_state.LCD_CLR~q\ : std_logic;
SIGNAL \current_state.LCD_CLR~q\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \Selector19~1_combout\ : std_logic;
SIGNAL \Selector19~2_combout\ : std_logic;
SIGNAL \next_state.ENTRY~feeder_combout\ : std_logic;
SIGNAL \next_state.ENTRY~q\ : std_logic;
SIGNAL \current_state.ENTRY~q\ : std_logic;
SIGNAL \Selector18~2_combout\ : std_logic;
SIGNAL \Selector18~3_combout\ : std_logic;
SIGNAL \Selector18~4_combout\ : std_logic;
SIGNAL \next_state.D_ON~q\ : std_logic;
SIGNAL \current_state.D_ON~q\ : std_logic;
SIGNAL \Selector25~2_combout\ : std_logic;
SIGNAL \Selector25~3_combout\ : std_logic;
SIGNAL \Selector25~4_combout\ : std_logic;
SIGNAL \next_state.L1~q\ : std_logic;
SIGNAL \current_state.L1~q\ : std_logic;
SIGNAL \Selector21~0_combout\ : std_logic;
SIGNAL \Selector21~2_combout\ : std_logic;
SIGNAL \Selector21~3_combout\ : std_logic;
SIGNAL \next_state.MESG1~q\ : std_logic;
SIGNAL \current_state.MESG1~feeder_combout\ : std_logic;
SIGNAL \current_state.MESG1~q\ : std_logic;
SIGNAL \LCD:contador[0]~0_combout\ : std_logic;
SIGNAL \LCD:contador[0]~q\ : std_logic;
SIGNAL \Selector12~1_combout\ : std_logic;
SIGNAL \LCD:contador[2]~q\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \Selector20~1_combout\ : std_logic;
SIGNAL \Selector20~2_combout\ : std_logic;
SIGNAL \next_state.ASK1~q\ : std_logic;
SIGNAL \current_state.ASK1~q\ : std_logic;
SIGNAL \WideOr2~combout\ : std_logic;
SIGNAL \next_state.LCD_INI~0_combout\ : std_logic;
SIGNAL \next_state.LCD_INI~feeder_combout\ : std_logic;
SIGNAL \next_state.LCD_INI~q\ : std_logic;
SIGNAL \current_state.LCD_INI~feeder_combout\ : std_logic;
SIGNAL \current_state.LCD_INI~q\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \LCD:contador[1]~q\ : std_logic;
SIGNAL \Selector23~1_combout\ : std_logic;
SIGNAL \Selector23~2_combout\ : std_logic;
SIGNAL \Selector23~3_combout\ : std_logic;
SIGNAL \next_state.ASK2~q\ : std_logic;
SIGNAL \current_state.ASK2~feeder_combout\ : std_logic;
SIGNAL \current_state.ASK2~q\ : std_logic;
SIGNAL \Selector5~2_combout\ : std_logic;
SIGNAL \Selector22~1_combout\ : std_logic;
SIGNAL \Selector22~2_combout\ : std_logic;
SIGNAL \next_state.MESG2~q\ : std_logic;
SIGNAL \current_state.MESG2~q\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \Mux33~0_combout\ : std_logic;
SIGNAL \Mux33~1_combout\ : std_logic;
SIGNAL \LCD:numMen~1_combout\ : std_logic;
SIGNAL \LCD:numMen~q\ : std_logic;
SIGNAL \Selector8~2_combout\ : std_logic;
SIGNAL \Selector8~3_combout\ : std_logic;
SIGNAL \Selector8~4_combout\ : std_logic;
SIGNAL \Selector8~6_combout\ : std_logic;
SIGNAL \Selector8~7_combout\ : std_logic;
SIGNAL \confirm~inputclkctrl_outclk\ : std_logic;
SIGNAL \acarreo~4_combout\ : std_logic;
SIGNAL \acarreo~5_combout\ : std_logic;
SIGNAL \acarreo~6_combout\ : std_logic;
SIGNAL \acarreo~2_combout\ : std_logic;
SIGNAL \acarreo~7_combout\ : std_logic;
SIGNAL \resultado~7_combout\ : std_logic;
SIGNAL \resultado~5_combout\ : std_logic;
SIGNAL \Mux53~6_combout\ : std_logic;
SIGNAL \acarreo~3_combout\ : std_logic;
SIGNAL \resultado~1_combout\ : std_logic;
SIGNAL \resultado~0_combout\ : std_logic;
SIGNAL \acarreo~1_combout\ : std_logic;
SIGNAL \resultado~6_combout\ : std_logic;
SIGNAL \Mux45~0_combout\ : std_logic;
SIGNAL \Mux53~7_combout\ : std_logic;
SIGNAL \acarreo~0_combout\ : std_logic;
SIGNAL \resultado~2_combout\ : std_logic;
SIGNAL \resultado~3_combout\ : std_logic;
SIGNAL \resultado~4_combout\ : std_logic;
SIGNAL \Mux39~0_combout\ : std_logic;
SIGNAL \Mux53~0_combout\ : std_logic;
SIGNAL \Mux53~1_combout\ : std_logic;
SIGNAL \Mux53~2_combout\ : std_logic;
SIGNAL \Mux53~3_combout\ : std_logic;
SIGNAL \Mux53~4_combout\ : std_logic;
SIGNAL \Mux53~5_combout\ : std_logic;
SIGNAL \Mux53~8_combout\ : std_logic;
SIGNAL \Selector8~1_combout\ : std_logic;
SIGNAL \Selector8~5_combout\ : std_logic;
SIGNAL \datos[0]~reg0_q\ : std_logic;
SIGNAL \Selector1~5_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Selector5~3_combout\ : std_logic;
SIGNAL \Selector7~6_combout\ : std_logic;
SIGNAL \Selector7~1_combout\ : std_logic;
SIGNAL \Mux44~0_combout\ : std_logic;
SIGNAL \Selector7~3_combout\ : std_logic;
SIGNAL \Mux38~0_combout\ : std_logic;
SIGNAL \Selector7~2_combout\ : std_logic;
SIGNAL \Selector7~5_combout\ : std_logic;
SIGNAL \Selector7~7_combout\ : std_logic;
SIGNAL \Selector7~8_combout\ : std_logic;
SIGNAL \datos[1]~reg0_q\ : std_logic;
SIGNAL \Mux31~0_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Mux37~0_combout\ : std_logic;
SIGNAL \Mux43~0_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \Selector6~2_combout\ : std_logic;
SIGNAL \Selector6~3_combout\ : std_logic;
SIGNAL \Selector6~4_combout\ : std_logic;
SIGNAL \datos[2]~reg0_q\ : std_logic;
SIGNAL \Selector5~4_combout\ : std_logic;
SIGNAL \Selector5~7_combout\ : std_logic;
SIGNAL \Selector5~8_combout\ : std_logic;
SIGNAL \Selector5~5_combout\ : std_logic;
SIGNAL \Selector5~6_combout\ : std_logic;
SIGNAL \Selector5~11_combout\ : std_logic;
SIGNAL \Selector5~9_combout\ : std_logic;
SIGNAL \Selector5~10_combout\ : std_logic;
SIGNAL \datos[3]~reg0_q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Mux49~0_combout\ : std_logic;
SIGNAL \Mux35~0_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \Selector4~2_combout\ : std_logic;
SIGNAL \Selector4~3_combout\ : std_logic;
SIGNAL \datos[4]~reg0_q\ : std_logic;
SIGNAL \Selector3~3_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \Selector3~4_combout\ : std_logic;
SIGNAL \Selector3~5_combout\ : std_logic;
SIGNAL \datos[5]~reg0_q\ : std_logic;
SIGNAL \Mux29~0_combout\ : std_logic;
SIGNAL \Selector2~4_combout\ : std_logic;
SIGNAL \Selector2~5_combout\ : std_logic;
SIGNAL \Selector2~2_combout\ : std_logic;
SIGNAL \Selector2~3_combout\ : std_logic;
SIGNAL \Selector2~7_combout\ : std_logic;
SIGNAL \Selector2~6_combout\ : std_logic;
SIGNAL \datos[6]~reg0_q\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \Selector1~3_combout\ : std_logic;
SIGNAL \Selector1~4_combout\ : std_logic;
SIGNAL \datos[7]~reg0_q\ : std_logic;
SIGNAL \LCD:EN~0_combout\ : std_logic;
SIGNAL \E~1_combout\ : std_logic;
SIGNAL \E~0_combout\ : std_logic;
SIGNAL \E~2_combout\ : std_logic;
SIGNAL \LCD:EN~q\ : std_logic;
SIGNAL \E~4_combout\ : std_logic;
SIGNAL \E~reg0_q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \RS~reg0_q\ : std_logic;
SIGNAL count_dly : std_logic_vector(13 DOWNTO 0);
SIGNAL acarreo : std_logic_vector(8 DOWNTO 0);
SIGNAL resultado : std_logic_vector(8 DOWNTO 0);
SIGNAL \ALT_INV_Mux21~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux14~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_a <= a;
ww_b <= b;
D1 <= ww_D1;
D2 <= ww_D2;
D3 <= ww_D3;
D4 <= ww_D4;
D5 <= ww_D5;
datos <= ww_datos;
ww_clr <= clr;
ww_clk <= clk;
ww_confirm <= confirm;
E <= ww_E;
RS <= ww_RS;
RW <= ww_RW;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\confirm~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \confirm~input_o\);

\clk_dly~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_dly~q\);

\clr~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clr~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_Mux21~0_combout\ <= NOT \Mux21~0_combout\;
\ALT_INV_Mux14~0_combout\ <= NOT \Mux14~0_combout\;
\ALT_INV_Mux7~0_combout\ <= NOT \Mux7~0_combout\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y52_N23
\D1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~0_combout\,
	devoe => ww_devoe,
	o => \D1[0]~output_o\);

-- Location: IOOBUF_X0_Y55_N16
\D1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~0_combout\,
	devoe => ww_devoe,
	o => \D1[1]~output_o\);

-- Location: IOOBUF_X0_Y52_N2
\D1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~0_combout\,
	devoe => ww_devoe,
	o => \D1[2]~output_o\);

-- Location: IOOBUF_X0_Y52_N16
\D1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~0_combout\,
	devoe => ww_devoe,
	o => \D1[3]~output_o\);

-- Location: IOOBUF_X0_Y50_N23
\D1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux2~0_combout\,
	devoe => ww_devoe,
	o => \D1[4]~output_o\);

-- Location: IOOBUF_X0_Y45_N23
\D1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~0_combout\,
	devoe => ww_devoe,
	o => \D1[5]~output_o\);

-- Location: IOOBUF_X0_Y46_N16
\D1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \D1[6]~output_o\);

-- Location: IOOBUF_X0_Y44_N2
\D2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux13~0_combout\,
	devoe => ww_devoe,
	o => \D2[0]~output_o\);

-- Location: IOOBUF_X0_Y55_N23
\D2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux12~0_combout\,
	devoe => ww_devoe,
	o => \D2[1]~output_o\);

-- Location: IOOBUF_X0_Y44_N23
\D2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux11~0_combout\,
	devoe => ww_devoe,
	o => \D2[2]~output_o\);

-- Location: IOOBUF_X0_Y62_N16
\D2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux10~0_combout\,
	devoe => ww_devoe,
	o => \D2[3]~output_o\);

-- Location: IOOBUF_X0_Y44_N16
\D2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux9~0_combout\,
	devoe => ww_devoe,
	o => \D2[4]~output_o\);

-- Location: IOOBUF_X0_Y60_N16
\D2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux8~0_combout\,
	devoe => ww_devoe,
	o => \D2[5]~output_o\);

-- Location: IOOBUF_X0_Y35_N16
\D2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux7~0_combout\,
	devoe => ww_devoe,
	o => \D2[6]~output_o\);

-- Location: IOOBUF_X0_Y66_N23
\D3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \D3[0]~output_o\);

-- Location: IOOBUF_X72_Y0_N9
\D3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D3[1]~output_o\);

-- Location: IOOBUF_X81_Y73_N16
\D3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D3[2]~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\D3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \D3[3]~output_o\);

-- Location: IOOBUF_X1_Y73_N2
\D3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \D3[4]~output_o\);

-- Location: IOOBUF_X115_Y34_N23
\D3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \D3[5]~output_o\);

-- Location: IOOBUF_X23_Y73_N16
\D3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D3[6]~output_o\);

-- Location: IOOBUF_X0_Y45_N16
\D4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux20~0_combout\,
	devoe => ww_devoe,
	o => \D4[0]~output_o\);

-- Location: IOOBUF_X0_Y47_N23
\D4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux19~0_combout\,
	devoe => ww_devoe,
	o => \D4[1]~output_o\);

-- Location: IOOBUF_X0_Y47_N16
\D4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux18~0_combout\,
	devoe => ww_devoe,
	o => \D4[2]~output_o\);

-- Location: IOOBUF_X0_Y46_N23
\D4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux17~0_combout\,
	devoe => ww_devoe,
	o => \D4[3]~output_o\);

-- Location: IOOBUF_X0_Y51_N16
\D4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux16~0_combout\,
	devoe => ww_devoe,
	o => \D4[4]~output_o\);

-- Location: IOOBUF_X0_Y47_N2
\D4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~0_combout\,
	devoe => ww_devoe,
	o => \D4[5]~output_o\);

-- Location: IOOBUF_X0_Y55_N9
\D4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux14~0_combout\,
	devoe => ww_devoe,
	o => \D4[6]~output_o\);

-- Location: IOOBUF_X0_Y44_N9
\D5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux27~0_combout\,
	devoe => ww_devoe,
	o => \D5[0]~output_o\);

-- Location: IOOBUF_X0_Y34_N23
\D5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux26~0_combout\,
	devoe => ww_devoe,
	o => \D5[1]~output_o\);

-- Location: IOOBUF_X0_Y61_N23
\D5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux25~0_combout\,
	devoe => ww_devoe,
	o => \D5[2]~output_o\);

-- Location: IOOBUF_X0_Y34_N9
\D5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux24~0_combout\,
	devoe => ww_devoe,
	o => \D5[3]~output_o\);

-- Location: IOOBUF_X0_Y32_N16
\D5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux23~0_combout\,
	devoe => ww_devoe,
	o => \D5[4]~output_o\);

-- Location: IOOBUF_X0_Y35_N2
\D5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux22~0_combout\,
	devoe => ww_devoe,
	o => \D5[5]~output_o\);

-- Location: IOOBUF_X0_Y34_N16
\D5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux21~0_combout\,
	devoe => ww_devoe,
	o => \D5[6]~output_o\);

-- Location: IOOBUF_X0_Y50_N16
\datos[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \datos[0]~reg0_q\,
	devoe => ww_devoe,
	o => \datos[0]~output_o\);

-- Location: IOOBUF_X0_Y53_N2
\datos[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \datos[1]~reg0_q\,
	devoe => ww_devoe,
	o => \datos[1]~output_o\);

-- Location: IOOBUF_X0_Y62_N23
\datos[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \datos[2]~reg0_q\,
	devoe => ww_devoe,
	o => \datos[2]~output_o\);

-- Location: IOOBUF_X0_Y33_N23
\datos[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \datos[3]~reg0_q\,
	devoe => ww_devoe,
	o => \datos[3]~output_o\);

-- Location: IOOBUF_X0_Y34_N2
\datos[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \datos[4]~reg0_q\,
	devoe => ww_devoe,
	o => \datos[4]~output_o\);

-- Location: IOOBUF_X0_Y32_N23
\datos[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \datos[5]~reg0_q\,
	devoe => ww_devoe,
	o => \datos[5]~output_o\);

-- Location: IOOBUF_X0_Y64_N2
\datos[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \datos[6]~reg0_q\,
	devoe => ww_devoe,
	o => \datos[6]~output_o\);

-- Location: IOOBUF_X0_Y49_N2
\datos[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \datos[7]~reg0_q\,
	devoe => ww_devoe,
	o => \datos[7]~output_o\);

-- Location: IOOBUF_X0_Y57_N23
\E~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \E~reg0_q\,
	devoe => ww_devoe,
	o => \E~output_o\);

-- Location: IOOBUF_X0_Y57_N16
\RS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RS~reg0_q\,
	devoe => ww_devoe,
	o => \RS~output_o\);

-- Location: IOOBUF_X83_Y0_N2
\RW~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \RW~output_o\);

-- Location: IOIBUF_X0_Y59_N15
\a[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: IOIBUF_X115_Y37_N8
\a[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: IOIBUF_X115_Y37_N1
\a[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: IOIBUF_X0_Y54_N8
\a[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: LCCOMB_X1_Y48_N8
\Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\a[3]~input_o\ & (((\a[1]~input_o\ & \a[2]~input_o\)))) # (!\a[3]~input_o\ & (!\a[1]~input_o\ & (\a[0]~input_o\ $ (\a[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[3]~input_o\,
	datab => \a[0]~input_o\,
	datac => \a[1]~input_o\,
	datad => \a[2]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X1_Y48_N10
\Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (!\a[3]~input_o\ & (\a[2]~input_o\ & (\a[0]~input_o\ $ (\a[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[3]~input_o\,
	datab => \a[0]~input_o\,
	datac => \a[1]~input_o\,
	datad => \a[2]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X1_Y48_N0
\Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\a[3]~input_o\ & (\a[0]~input_o\ & (\a[1]~input_o\ $ (\a[2]~input_o\)))) # (!\a[3]~input_o\ & (!\a[0]~input_o\ & (\a[1]~input_o\ & !\a[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[3]~input_o\,
	datab => \a[0]~input_o\,
	datac => \a[1]~input_o\,
	datad => \a[2]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X1_Y48_N6
\Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\a[0]~input_o\ & (\a[3]~input_o\ $ (\a[1]~input_o\ $ (!\a[2]~input_o\)))) # (!\a[0]~input_o\ & ((\a[1]~input_o\ & (\a[3]~input_o\)) # (!\a[1]~input_o\ & ((\a[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101110100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[3]~input_o\,
	datab => \a[0]~input_o\,
	datac => \a[1]~input_o\,
	datad => \a[2]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X1_Y48_N4
\Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\a[0]~input_o\) # ((\a[2]~input_o\ & ((\a[3]~input_o\) # (!\a[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[3]~input_o\,
	datab => \a[0]~input_o\,
	datac => \a[1]~input_o\,
	datad => \a[2]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X1_Y48_N30
\Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\a[0]~input_o\ & ((\a[1]~input_o\) # ((!\a[3]~input_o\ & !\a[2]~input_o\)))) # (!\a[0]~input_o\ & (\a[1]~input_o\ & (\a[3]~input_o\ $ (!\a[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[3]~input_o\,
	datab => \a[0]~input_o\,
	datac => \a[1]~input_o\,
	datad => \a[2]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X1_Y48_N12
\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\a[3]~input_o\ & (!\a[2]~input_o\ & ((!\a[1]~input_o\) # (!\a[0]~input_o\)))) # (!\a[3]~input_o\ & ((\a[1]~input_o\ & ((!\a[2]~input_o\) # (!\a[0]~input_o\))) # (!\a[1]~input_o\ & ((\a[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[3]~input_o\,
	datab => \a[0]~input_o\,
	datac => \a[1]~input_o\,
	datad => \a[2]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: IOIBUF_X0_Y53_N8
\a[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(7),
	o => \a[7]~input_o\);

-- Location: IOIBUF_X0_Y49_N8
\a[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(5),
	o => \a[5]~input_o\);

-- Location: IOIBUF_X0_Y58_N15
\a[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(4),
	o => \a[4]~input_o\);

-- Location: IOIBUF_X0_Y59_N22
\a[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(6),
	o => \a[6]~input_o\);

-- Location: LCCOMB_X3_Y48_N28
\Mux13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (\a[7]~input_o\ & (\a[5]~input_o\ & ((\a[6]~input_o\)))) # (!\a[7]~input_o\ & (!\a[5]~input_o\ & (\a[4]~input_o\ $ (\a[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datab => \a[5]~input_o\,
	datac => \a[4]~input_o\,
	datad => \a[6]~input_o\,
	combout => \Mux13~0_combout\);

-- Location: LCCOMB_X3_Y48_N26
\Mux12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = (!\a[7]~input_o\ & (\a[6]~input_o\ & (\a[5]~input_o\ $ (\a[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datab => \a[5]~input_o\,
	datac => \a[4]~input_o\,
	datad => \a[6]~input_o\,
	combout => \Mux12~0_combout\);

-- Location: LCCOMB_X3_Y48_N0
\Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (\a[7]~input_o\ & (\a[4]~input_o\ & (\a[5]~input_o\ $ (\a[6]~input_o\)))) # (!\a[7]~input_o\ & (\a[5]~input_o\ & (!\a[4]~input_o\ & !\a[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datab => \a[5]~input_o\,
	datac => \a[4]~input_o\,
	datad => \a[6]~input_o\,
	combout => \Mux11~0_combout\);

-- Location: LCCOMB_X3_Y48_N2
\Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\a[5]~input_o\ & (\a[7]~input_o\ $ (((\a[4]~input_o\ & \a[6]~input_o\))))) # (!\a[5]~input_o\ & (\a[6]~input_o\ $ (((!\a[7]~input_o\ & \a[4]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datab => \a[5]~input_o\,
	datac => \a[4]~input_o\,
	datad => \a[6]~input_o\,
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X3_Y48_N8
\Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (\a[4]~input_o\) # ((\a[6]~input_o\ & ((\a[7]~input_o\) # (!\a[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datab => \a[5]~input_o\,
	datac => \a[4]~input_o\,
	datad => \a[6]~input_o\,
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X3_Y48_N10
\Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (\a[5]~input_o\ & ((\a[4]~input_o\) # (\a[7]~input_o\ $ (!\a[6]~input_o\)))) # (!\a[5]~input_o\ & (!\a[7]~input_o\ & (\a[4]~input_o\ & !\a[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datab => \a[5]~input_o\,
	datac => \a[4]~input_o\,
	datad => \a[6]~input_o\,
	combout => \Mux8~0_combout\);

-- Location: LCCOMB_X3_Y48_N4
\Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\a[7]~input_o\ & (!\a[6]~input_o\ & ((!\a[4]~input_o\) # (!\a[5]~input_o\)))) # (!\a[7]~input_o\ & ((\a[5]~input_o\ & ((!\a[6]~input_o\) # (!\a[4]~input_o\))) # (!\a[5]~input_o\ & ((\a[6]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datab => \a[5]~input_o\,
	datac => \a[4]~input_o\,
	datad => \a[6]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: IOIBUF_X0_Y35_N8
\b[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: IOIBUF_X0_Y33_N15
\b[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: IOIBUF_X0_Y31_N15
\b[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: IOIBUF_X0_Y48_N8
\b[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: LCCOMB_X1_Y48_N14
\Mux20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux20~0_combout\ = (\b[1]~input_o\ & (\b[2]~input_o\ & ((\b[3]~input_o\)))) # (!\b[1]~input_o\ & (!\b[3]~input_o\ & (\b[2]~input_o\ $ (\b[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \b[0]~input_o\,
	datac => \b[1]~input_o\,
	datad => \b[3]~input_o\,
	combout => \Mux20~0_combout\);

-- Location: LCCOMB_X1_Y48_N20
\Mux19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux19~0_combout\ = (\b[2]~input_o\ & (!\b[3]~input_o\ & (\b[0]~input_o\ $ (\b[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \b[0]~input_o\,
	datac => \b[1]~input_o\,
	datad => \b[3]~input_o\,
	combout => \Mux19~0_combout\);

-- Location: LCCOMB_X1_Y48_N26
\Mux18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux18~0_combout\ = (\b[2]~input_o\ & (\b[0]~input_o\ & (!\b[1]~input_o\ & \b[3]~input_o\))) # (!\b[2]~input_o\ & (\b[1]~input_o\ & (\b[0]~input_o\ $ (!\b[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \b[0]~input_o\,
	datac => \b[1]~input_o\,
	datad => \b[3]~input_o\,
	combout => \Mux18~0_combout\);

-- Location: LCCOMB_X1_Y48_N16
\Mux17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux17~0_combout\ = (\b[0]~input_o\ & (\b[2]~input_o\ $ (\b[1]~input_o\ $ (!\b[3]~input_o\)))) # (!\b[0]~input_o\ & ((\b[1]~input_o\ & ((\b[3]~input_o\))) # (!\b[1]~input_o\ & (\b[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101010000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \b[0]~input_o\,
	datac => \b[1]~input_o\,
	datad => \b[3]~input_o\,
	combout => \Mux17~0_combout\);

-- Location: LCCOMB_X1_Y48_N22
\Mux16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux16~0_combout\ = (\b[0]~input_o\) # ((\b[2]~input_o\ & ((\b[3]~input_o\) # (!\b[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \b[0]~input_o\,
	datac => \b[1]~input_o\,
	datad => \b[3]~input_o\,
	combout => \Mux16~0_combout\);

-- Location: LCCOMB_X1_Y48_N24
\Mux15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (\b[0]~input_o\ & ((\b[1]~input_o\) # ((!\b[2]~input_o\ & !\b[3]~input_o\)))) # (!\b[0]~input_o\ & (\b[1]~input_o\ & (\b[2]~input_o\ $ (!\b[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \b[0]~input_o\,
	datac => \b[1]~input_o\,
	datad => \b[3]~input_o\,
	combout => \Mux15~0_combout\);

-- Location: LCCOMB_X1_Y48_N18
\Mux14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux14~0_combout\ = (\b[2]~input_o\ & (!\b[3]~input_o\ & ((!\b[1]~input_o\) # (!\b[0]~input_o\)))) # (!\b[2]~input_o\ & ((\b[1]~input_o\ & ((!\b[3]~input_o\) # (!\b[0]~input_o\))) # (!\b[1]~input_o\ & ((\b[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \b[0]~input_o\,
	datac => \b[1]~input_o\,
	datad => \b[3]~input_o\,
	combout => \Mux14~0_combout\);

-- Location: IOIBUF_X0_Y42_N1
\b[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(4),
	o => \b[4]~input_o\);

-- Location: IOIBUF_X0_Y42_N8
\b[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(7),
	o => \b[7]~input_o\);

-- Location: IOIBUF_X0_Y43_N15
\b[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(6),
	o => \b[6]~input_o\);

-- Location: IOIBUF_X0_Y48_N1
\b[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(5),
	o => \b[5]~input_o\);

-- Location: LCCOMB_X3_Y48_N30
\Mux27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux27~0_combout\ = (\b[7]~input_o\ & (((\b[6]~input_o\ & \b[5]~input_o\)))) # (!\b[7]~input_o\ & (!\b[5]~input_o\ & (\b[4]~input_o\ $ (\b[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[4]~input_o\,
	datab => \b[7]~input_o\,
	datac => \b[6]~input_o\,
	datad => \b[5]~input_o\,
	combout => \Mux27~0_combout\);

-- Location: LCCOMB_X4_Y48_N0
\Mux26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux26~0_combout\ = (!\b[7]~input_o\ & (\b[6]~input_o\ & (\b[5]~input_o\ $ (\b[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[7]~input_o\,
	datab => \b[6]~input_o\,
	datac => \b[5]~input_o\,
	datad => \b[4]~input_o\,
	combout => \Mux26~0_combout\);

-- Location: LCCOMB_X3_Y48_N12
\Mux25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux25~0_combout\ = (\b[4]~input_o\ & (\b[7]~input_o\ & (\b[6]~input_o\ $ (\b[5]~input_o\)))) # (!\b[4]~input_o\ & (!\b[7]~input_o\ & (!\b[6]~input_o\ & \b[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[4]~input_o\,
	datab => \b[7]~input_o\,
	datac => \b[6]~input_o\,
	datad => \b[5]~input_o\,
	combout => \Mux25~0_combout\);

-- Location: LCCOMB_X4_Y48_N6
\Mux24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux24~0_combout\ = (\b[5]~input_o\ & (\b[7]~input_o\ $ (((\b[6]~input_o\ & \b[4]~input_o\))))) # (!\b[5]~input_o\ & (\b[6]~input_o\ $ (((!\b[7]~input_o\ & \b[4]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[7]~input_o\,
	datab => \b[6]~input_o\,
	datac => \b[5]~input_o\,
	datad => \b[4]~input_o\,
	combout => \Mux24~0_combout\);

-- Location: LCCOMB_X4_Y48_N28
\Mux23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux23~0_combout\ = (\b[4]~input_o\) # ((\b[6]~input_o\ & ((\b[7]~input_o\) # (!\b[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[7]~input_o\,
	datab => \b[6]~input_o\,
	datac => \b[5]~input_o\,
	datad => \b[4]~input_o\,
	combout => \Mux23~0_combout\);

-- Location: LCCOMB_X4_Y48_N26
\Mux22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux22~0_combout\ = (\b[5]~input_o\ & ((\b[4]~input_o\) # (\b[7]~input_o\ $ (!\b[6]~input_o\)))) # (!\b[5]~input_o\ & (!\b[7]~input_o\ & (!\b[6]~input_o\ & \b[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[7]~input_o\,
	datab => \b[6]~input_o\,
	datac => \b[5]~input_o\,
	datad => \b[4]~input_o\,
	combout => \Mux22~0_combout\);

-- Location: LCCOMB_X4_Y48_N4
\Mux21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux21~0_combout\ = (\b[7]~input_o\ & (!\b[6]~input_o\ & ((!\b[4]~input_o\) # (!\b[5]~input_o\)))) # (!\b[7]~input_o\ & ((\b[6]~input_o\ & ((!\b[4]~input_o\) # (!\b[5]~input_o\))) # (!\b[6]~input_o\ & (\b[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011001110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[7]~input_o\,
	datab => \b[6]~input_o\,
	datac => \b[5]~input_o\,
	datad => \b[4]~input_o\,
	combout => \Mux21~0_combout\);

-- Location: IOIBUF_X0_Y36_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y36_N22
\clr~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clr,
	o => \clr~input_o\);

-- Location: LCCOMB_X2_Y49_N2
\count_dly[0]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[0]~14_combout\ = count_dly(0) $ (VCC)
-- \count_dly[0]~15\ = CARRY(count_dly(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_dly(0),
	datad => VCC,
	combout => \count_dly[0]~14_combout\,
	cout => \count_dly[0]~15\);

-- Location: FF_X2_Y49_N3
\count_dly[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[0]~14_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(0));

-- Location: LCCOMB_X2_Y49_N4
\count_dly[1]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[1]~16_combout\ = (count_dly(1) & (!\count_dly[0]~15\)) # (!count_dly(1) & ((\count_dly[0]~15\) # (GND)))
-- \count_dly[1]~17\ = CARRY((!\count_dly[0]~15\) # (!count_dly(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_dly(1),
	datad => VCC,
	cin => \count_dly[0]~15\,
	combout => \count_dly[1]~16_combout\,
	cout => \count_dly[1]~17\);

-- Location: FF_X2_Y49_N5
\count_dly[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[1]~16_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(1));

-- Location: LCCOMB_X2_Y49_N6
\count_dly[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[2]~18_combout\ = (count_dly(2) & (\count_dly[1]~17\ $ (GND))) # (!count_dly(2) & (!\count_dly[1]~17\ & VCC))
-- \count_dly[2]~19\ = CARRY((count_dly(2) & !\count_dly[1]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(2),
	datad => VCC,
	cin => \count_dly[1]~17\,
	combout => \count_dly[2]~18_combout\,
	cout => \count_dly[2]~19\);

-- Location: FF_X2_Y49_N7
\count_dly[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[2]~18_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(2));

-- Location: LCCOMB_X2_Y49_N8
\count_dly[3]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[3]~20_combout\ = (count_dly(3) & (!\count_dly[2]~19\)) # (!count_dly(3) & ((\count_dly[2]~19\) # (GND)))
-- \count_dly[3]~21\ = CARRY((!\count_dly[2]~19\) # (!count_dly(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_dly(3),
	datad => VCC,
	cin => \count_dly[2]~19\,
	combout => \count_dly[3]~20_combout\,
	cout => \count_dly[3]~21\);

-- Location: FF_X2_Y49_N9
\count_dly[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[3]~20_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(3));

-- Location: LCCOMB_X2_Y49_N10
\count_dly[4]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[4]~22_combout\ = (count_dly(4) & (\count_dly[3]~21\ $ (GND))) # (!count_dly(4) & (!\count_dly[3]~21\ & VCC))
-- \count_dly[4]~23\ = CARRY((count_dly(4) & !\count_dly[3]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(4),
	datad => VCC,
	cin => \count_dly[3]~21\,
	combout => \count_dly[4]~22_combout\,
	cout => \count_dly[4]~23\);

-- Location: FF_X2_Y49_N11
\count_dly[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[4]~22_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(4));

-- Location: LCCOMB_X2_Y49_N12
\count_dly[5]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[5]~24_combout\ = (count_dly(5) & (!\count_dly[4]~23\)) # (!count_dly(5) & ((\count_dly[4]~23\) # (GND)))
-- \count_dly[5]~25\ = CARRY((!\count_dly[4]~23\) # (!count_dly(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(5),
	datad => VCC,
	cin => \count_dly[4]~23\,
	combout => \count_dly[5]~24_combout\,
	cout => \count_dly[5]~25\);

-- Location: FF_X2_Y49_N13
\count_dly[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[5]~24_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(5));

-- Location: LCCOMB_X2_Y49_N14
\count_dly[6]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[6]~26_combout\ = (count_dly(6) & (\count_dly[5]~25\ $ (GND))) # (!count_dly(6) & (!\count_dly[5]~25\ & VCC))
-- \count_dly[6]~27\ = CARRY((count_dly(6) & !\count_dly[5]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(6),
	datad => VCC,
	cin => \count_dly[5]~25\,
	combout => \count_dly[6]~26_combout\,
	cout => \count_dly[6]~27\);

-- Location: FF_X2_Y49_N15
\count_dly[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[6]~26_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(6));

-- Location: LCCOMB_X2_Y49_N16
\count_dly[7]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[7]~28_combout\ = (count_dly(7) & (!\count_dly[6]~27\)) # (!count_dly(7) & ((\count_dly[6]~27\) # (GND)))
-- \count_dly[7]~29\ = CARRY((!\count_dly[6]~27\) # (!count_dly(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(7),
	datad => VCC,
	cin => \count_dly[6]~27\,
	combout => \count_dly[7]~28_combout\,
	cout => \count_dly[7]~29\);

-- Location: FF_X2_Y49_N17
\count_dly[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[7]~28_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(7));

-- Location: LCCOMB_X2_Y49_N18
\count_dly[8]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[8]~30_combout\ = (count_dly(8) & (\count_dly[7]~29\ $ (GND))) # (!count_dly(8) & (!\count_dly[7]~29\ & VCC))
-- \count_dly[8]~31\ = CARRY((count_dly(8) & !\count_dly[7]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_dly(8),
	datad => VCC,
	cin => \count_dly[7]~29\,
	combout => \count_dly[8]~30_combout\,
	cout => \count_dly[8]~31\);

-- Location: FF_X2_Y49_N19
\count_dly[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[8]~30_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(8));

-- Location: LCCOMB_X2_Y49_N20
\count_dly[9]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[9]~32_combout\ = (count_dly(9) & (!\count_dly[8]~31\)) # (!count_dly(9) & ((\count_dly[8]~31\) # (GND)))
-- \count_dly[9]~33\ = CARRY((!\count_dly[8]~31\) # (!count_dly(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_dly(9),
	datad => VCC,
	cin => \count_dly[8]~31\,
	combout => \count_dly[9]~32_combout\,
	cout => \count_dly[9]~33\);

-- Location: FF_X2_Y49_N21
\count_dly[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[9]~32_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(9));

-- Location: LCCOMB_X2_Y49_N22
\count_dly[10]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[10]~34_combout\ = (count_dly(10) & (\count_dly[9]~33\ $ (GND))) # (!count_dly(10) & (!\count_dly[9]~33\ & VCC))
-- \count_dly[10]~35\ = CARRY((count_dly(10) & !\count_dly[9]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(10),
	datad => VCC,
	cin => \count_dly[9]~33\,
	combout => \count_dly[10]~34_combout\,
	cout => \count_dly[10]~35\);

-- Location: FF_X2_Y49_N23
\count_dly[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[10]~34_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(10));

-- Location: LCCOMB_X2_Y49_N24
\count_dly[11]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[11]~36_combout\ = (count_dly(11) & (!\count_dly[10]~35\)) # (!count_dly(11) & ((\count_dly[10]~35\) # (GND)))
-- \count_dly[11]~37\ = CARRY((!\count_dly[10]~35\) # (!count_dly(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_dly(11),
	datad => VCC,
	cin => \count_dly[10]~35\,
	combout => \count_dly[11]~36_combout\,
	cout => \count_dly[11]~37\);

-- Location: FF_X2_Y49_N25
\count_dly[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[11]~36_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(11));

-- Location: LCCOMB_X2_Y49_N26
\count_dly[12]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[12]~38_combout\ = (count_dly(12) & (\count_dly[11]~37\ $ (GND))) # (!count_dly(12) & (!\count_dly[11]~37\ & VCC))
-- \count_dly[12]~39\ = CARRY((count_dly(12) & !\count_dly[11]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(12),
	datad => VCC,
	cin => \count_dly[11]~37\,
	combout => \count_dly[12]~38_combout\,
	cout => \count_dly[12]~39\);

-- Location: FF_X2_Y49_N27
\count_dly[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[12]~38_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(12));

-- Location: LCCOMB_X2_Y49_N28
\count_dly[13]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[13]~40_combout\ = \count_dly[12]~39\ $ (count_dly(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => count_dly(13),
	cin => \count_dly[12]~39\,
	combout => \count_dly[13]~40_combout\);

-- Location: FF_X2_Y49_N29
\count_dly[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count_dly[13]~40_combout\,
	sclr => \LessThan3~2_combout\,
	ena => \clr~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(13));

-- Location: LCCOMB_X2_Y49_N0
\LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (!count_dly(4) & (!count_dly(7) & (!count_dly(6) & !count_dly(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(4),
	datab => count_dly(7),
	datac => count_dly(6),
	datad => count_dly(5),
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X2_Y49_N30
\LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = (((\LessThan3~0_combout\) # (!count_dly(9))) # (!count_dly(8))) # (!count_dly(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(10),
	datab => count_dly(8),
	datac => count_dly(9),
	datad => \LessThan3~0_combout\,
	combout => \LessThan3~1_combout\);

-- Location: LCCOMB_X3_Y49_N6
\LessThan3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~2_combout\ = (count_dly(13) & ((count_dly(11)) # ((count_dly(12)) # (!\LessThan3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(11),
	datab => count_dly(13),
	datac => count_dly(12),
	datad => \LessThan3~1_combout\,
	combout => \LessThan3~2_combout\);

-- Location: LCCOMB_X1_Y49_N28
\clk_dly~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_dly~0_combout\ = \clk_dly~q\ $ (((\clr~input_o\ & \LessThan3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clr~input_o\,
	datac => \clk_dly~q\,
	datad => \LessThan3~2_combout\,
	combout => \clk_dly~0_combout\);

-- Location: LCCOMB_X1_Y49_N16
\clk_dly~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_dly~feeder_combout\ = \clk_dly~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk_dly~0_combout\,
	combout => \clk_dly~feeder_combout\);

-- Location: FF_X1_Y49_N17
clk_dly : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \clk_dly~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_dly~q\);

-- Location: CLKCTRL_G1
\clk_dly~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_dly~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_dly~clkctrl_outclk\);

-- Location: LCCOMB_X5_Y49_N12
\Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = (!\LCD:contador[2]~q\ & (!\LCD:contador[0]~q\ & ((!\LCD:contador[1]~q\) # (!\current_state.LCD_INI~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.LCD_INI~q\,
	datab => \LCD:contador[2]~q\,
	datac => \LCD:contador[0]~q\,
	datad => \LCD:contador[1]~q\,
	combout => \Selector14~0_combout\);

-- Location: LCCOMB_X4_Y49_N12
\WideOr9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr9~0_combout\ = (!\current_state.MESG2~q\ & !\current_state.MESG1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.MESG2~q\,
	datad => \current_state.MESG1~q\,
	combout => \WideOr9~0_combout\);

-- Location: LCCOMB_X8_Y49_N10
\LCD:contador2[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador2[0]~0_combout\ = \LCD:contador2[0]~q\ $ (((!\WideOr9~0_combout\ & ((\LessThan2~0_combout\) # (\LessThan1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr9~0_combout\,
	datab => \LessThan2~0_combout\,
	datac => \LCD:contador2[0]~q\,
	datad => \LessThan1~0_combout\,
	combout => \LCD:contador2[0]~0_combout\);

-- Location: FF_X8_Y49_N11
\LCD:contador2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \LCD:contador2[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:contador2[0]~q\);

-- Location: LCCOMB_X7_Y49_N20
\LCD:contador2[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador2[2]~0_combout\ = (\LessThan2~0_combout\) # ((\LCD:contador[2]~q\) # (\LCD:contador[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~0_combout\,
	datac => \LCD:contador[2]~q\,
	datad => \LCD:contador[1]~q\,
	combout => \LCD:contador2[2]~0_combout\);

-- Location: LCCOMB_X8_Y49_N28
\LCD:contador2[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador2[1]~0_combout\ = \LCD:contador2[1]~q\ $ (((!\WideOr9~0_combout\ & (\LCD:contador2[0]~q\ & \LCD:contador2[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr9~0_combout\,
	datab => \LCD:contador2[0]~q\,
	datac => \LCD:contador2[1]~q\,
	datad => \LCD:contador2[2]~0_combout\,
	combout => \LCD:contador2[1]~0_combout\);

-- Location: FF_X8_Y49_N29
\LCD:contador2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \LCD:contador2[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:contador2[1]~q\);

-- Location: LCCOMB_X8_Y49_N12
\LCD:contador2[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador2[2]~1_combout\ = (!\WideOr9~0_combout\ & (\LCD:contador2[1]~q\ & (\LCD:contador2[0]~q\ & \LCD:contador2[2]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr9~0_combout\,
	datab => \LCD:contador2[1]~q\,
	datac => \LCD:contador2[0]~q\,
	datad => \LCD:contador2[2]~0_combout\,
	combout => \LCD:contador2[2]~1_combout\);

-- Location: LCCOMB_X8_Y49_N30
\LCD:contador2[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador2[2]~2_combout\ = \LCD:contador2[2]~q\ $ (\LCD:contador2[2]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LCD:contador2[2]~q\,
	datad => \LCD:contador2[2]~1_combout\,
	combout => \LCD:contador2[2]~2_combout\);

-- Location: FF_X8_Y49_N31
\LCD:contador2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \LCD:contador2[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:contador2[2]~q\);

-- Location: LCCOMB_X8_Y49_N4
\LCD:contador2[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador2[3]~0_combout\ = \LCD:contador2[3]~q\ $ (((\LCD:contador2[2]~q\ & \LCD:contador2[2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \LCD:contador2[2]~1_combout\,
	combout => \LCD:contador2[3]~0_combout\);

-- Location: FF_X8_Y49_N5
\LCD:contador2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \LCD:contador2[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:contador2[3]~q\);

-- Location: LCCOMB_X8_Y49_N2
\LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (\LCD:contador2[2]~q\ & (\LCD:contador2[1]~q\ & (\LCD:contador2[3]~q\ & \LCD:contador2[0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \LCD:contador2[0]~q\,
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X8_Y49_N16
\LCD:numMen~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:numMen~0_combout\ = (\current_state.MESG1~q\ & !\LessThan2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.MESG1~q\,
	datad => \LessThan2~0_combout\,
	combout => \LCD:numMen~0_combout\);

-- Location: LCCOMB_X3_Y49_N10
\Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = (!\LCD:contador[2]~q\ & !\current_state.LCD_INI~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LCD:contador[2]~q\,
	datad => \current_state.LCD_INI~q\,
	combout => \Selector12~0_combout\);

-- Location: LCCOMB_X3_Y49_N4
\Selector21~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~1_combout\ = (!\Selector12~0_combout\ & ((\LessThan1~0_combout\) # ((\LessThan2~0_combout\) # (!\current_state.MESG2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \current_state.MESG2~q\,
	datac => \LessThan2~0_combout\,
	datad => \Selector12~0_combout\,
	combout => \Selector21~1_combout\);

-- Location: IOIBUF_X0_Y36_N15
\confirm~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_confirm,
	o => \confirm~input_o\);

-- Location: LCCOMB_X4_Y49_N26
\Selector24~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector24~2_combout\ = (\current_state.MESG2~q\ & ((\LessThan2~0_combout\) # ((\current_state.ASK3~q\ & \confirm~input_o\)))) # (!\current_state.MESG2~q\ & (\current_state.ASK3~q\ & ((\confirm~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG2~q\,
	datab => \current_state.ASK3~q\,
	datac => \LessThan2~0_combout\,
	datad => \confirm~input_o\,
	combout => \Selector24~2_combout\);

-- Location: LCCOMB_X4_Y49_N30
\Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector22~0_combout\ = (!\Selector12~0_combout\ & ((\LessThan1~0_combout\) # ((\LessThan2~0_combout\) # (!\current_state.MESG1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector12~0_combout\,
	datab => \LessThan1~0_combout\,
	datac => \LessThan2~0_combout\,
	datad => \current_state.MESG1~q\,
	combout => \Selector22~0_combout\);

-- Location: LCCOMB_X3_Y49_N24
\Selector26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~0_combout\ = ((!\LessThan1~0_combout\ & ((\current_state.MESG1~q\) # (!\E~3_combout\)))) # (!\Selector21~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \current_state.MESG1~q\,
	datac => \Selector21~1_combout\,
	datad => \E~3_combout\,
	combout => \Selector26~0_combout\);

-- Location: LCCOMB_X3_Y49_N0
\Selector26~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~1_combout\ = (\LessThan2~0_combout\ & ((\current_state.MESG1~q\) # ((\next_state.L2~q\ & \Selector26~0_combout\)))) # (!\LessThan2~0_combout\ & (\next_state.L2~q\ & ((\Selector26~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~0_combout\,
	datab => \next_state.L2~q\,
	datac => \current_state.MESG1~q\,
	datad => \Selector26~0_combout\,
	combout => \Selector26~1_combout\);

-- Location: LCCOMB_X3_Y49_N14
\next_state.L2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.L2~feeder_combout\ = \Selector26~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector26~1_combout\,
	combout => \next_state.L2~feeder_combout\);

-- Location: FF_X3_Y49_N15
\next_state.L2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \next_state.L2~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.L2~q\);

-- Location: CLKCTRL_G0
\clr~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clr~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clr~inputclkctrl_outclk\);

-- Location: FF_X3_Y49_N23
\current_state.L2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.L2~q\,
	clrn => \clr~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.L2~q\);

-- Location: LCCOMB_X4_Y49_N14
\Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = (\LCD:contador[2]~q\ & !\current_state.LCD_INI~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador[2]~q\,
	datab => \current_state.LCD_INI~q\,
	combout => \Selector16~0_combout\);

-- Location: LCCOMB_X5_Y49_N28
\Selector16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~1_combout\ = (\current_state.LCD_INI~q\ & ((\LCD:contador[1]~q\) # (\LCD:contador[2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador[1]~q\,
	datab => \LCD:contador[2]~q\,
	datad => \current_state.LCD_INI~q\,
	combout => \Selector16~1_combout\);

-- Location: LCCOMB_X5_Y49_N18
\Selector16~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~2_combout\ = (\Selector16~1_combout\) # ((\LessThan2~0_combout\ & ((\current_state.MESG1~q\) # (\current_state.MESG2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~0_combout\,
	datab => \current_state.MESG1~q\,
	datac => \current_state.MESG2~q\,
	datad => \Selector16~1_combout\,
	combout => \Selector16~2_combout\);

-- Location: LCCOMB_X5_Y49_N4
\Selector16~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~3_combout\ = (!\WideOr2~combout\ & ((\Selector16~0_combout\ & ((\next_state.D_OFF~q\) # (!\Selector16~2_combout\))) # (!\Selector16~0_combout\ & (\next_state.D_OFF~q\ & !\Selector16~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector16~0_combout\,
	datab => \WideOr2~combout\,
	datac => \next_state.D_OFF~q\,
	datad => \Selector16~2_combout\,
	combout => \Selector16~3_combout\);

-- Location: FF_X6_Y49_N5
\next_state.D_OFF\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	asdata => \Selector16~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.D_OFF~q\);

-- Location: FF_X6_Y49_N17
\current_state.D_OFF\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.D_OFF~q\,
	clrn => \clr~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.D_OFF~q\);

-- Location: LCCOMB_X6_Y49_N12
\Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector23~0_combout\ = (!\current_state.ENTRY~q\ & (!\current_state.LCD_CLR~q\ & (!\current_state.D_ON~q\ & !\current_state.D_OFF~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.ENTRY~q\,
	datab => \current_state.LCD_CLR~q\,
	datac => \current_state.D_ON~q\,
	datad => \current_state.D_OFF~q\,
	combout => \Selector23~0_combout\);

-- Location: LCCOMB_X6_Y49_N26
\E~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \E~3_combout\ = (!\current_state.L1~q\ & (!\current_state.L2~q\ & \Selector23~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L1~q\,
	datab => \current_state.L2~q\,
	datad => \Selector23~0_combout\,
	combout => \E~3_combout\);

-- Location: LCCOMB_X5_Y49_N22
\Selector24~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector24~4_combout\ = (!\LCD:contador[1]~q\ & (!\LCD:contador[2]~q\ & ((\current_state.MESG2~q\) # (!\E~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador[1]~q\,
	datab => \LCD:contador[2]~q\,
	datac => \current_state.MESG2~q\,
	datad => \E~3_combout\,
	combout => \Selector24~4_combout\);

-- Location: LCCOMB_X4_Y49_N0
\Selector24~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector24~3_combout\ = (\Selector24~2_combout\) # ((\next_state.ASK3~q\ & ((\Selector24~4_combout\) # (!\Selector22~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector24~2_combout\,
	datab => \next_state.ASK3~q\,
	datac => \Selector22~0_combout\,
	datad => \Selector24~4_combout\,
	combout => \Selector24~3_combout\);

-- Location: FF_X4_Y49_N15
\next_state.ASK3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	asdata => \Selector24~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.ASK3~q\);

-- Location: FF_X4_Y49_N5
\current_state.ASK3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.ASK3~q\,
	clrn => \clr~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.ASK3~q\);

-- Location: LCCOMB_X6_Y49_N0
\Selector7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~4_combout\ = (!\current_state.ENTRY~q\ & !\current_state.D_ON~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.ENTRY~q\,
	datad => \current_state.D_ON~q\,
	combout => \Selector7~4_combout\);

-- Location: LCCOMB_X3_Y49_N18
\Selector17~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~1_combout\ = (!\current_state.L2~q\ & (!\current_state.LCD_CLR~q\ & !\current_state.L1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L2~q\,
	datab => \current_state.LCD_CLR~q\,
	datad => \current_state.L1~q\,
	combout => \Selector17~1_combout\);

-- Location: LCCOMB_X3_Y49_N30
\Selector17~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~2_combout\ = (\LessThan1~0_combout\) # ((\Selector7~4_combout\ & (\next_state.LCD_CLR~q\ & \Selector17~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \Selector7~4_combout\,
	datac => \next_state.LCD_CLR~q\,
	datad => \Selector17~1_combout\,
	combout => \Selector17~2_combout\);

-- Location: LCCOMB_X3_Y49_N2
\Selector17~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~3_combout\ = (\Selector17~2_combout\ & ((\current_state.D_OFF~q\) # ((\next_state.LCD_CLR~q\ & !\Selector17~0_combout\)))) # (!\Selector17~2_combout\ & (\next_state.LCD_CLR~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.LCD_CLR~q\,
	datab => \current_state.D_OFF~q\,
	datac => \Selector17~2_combout\,
	datad => \Selector17~0_combout\,
	combout => \Selector17~3_combout\);

-- Location: LCCOMB_X3_Y49_N26
\Selector17~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~4_combout\ = (\Selector17~3_combout\) # ((\current_state.ASK3~q\ & !\confirm~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.ASK3~q\,
	datac => \confirm~input_o\,
	datad => \Selector17~3_combout\,
	combout => \Selector17~4_combout\);

-- Location: FF_X3_Y49_N27
\next_state.LCD_CLR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector17~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.LCD_CLR~q\);

-- Location: FF_X3_Y49_N31
\current_state.LCD_CLR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.LCD_CLR~q\,
	clrn => \clr~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.LCD_CLR~q\);

-- Location: LCCOMB_X6_Y49_N16
\Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = (\current_state.L1~q\) # ((\current_state.L2~q\) # ((\current_state.D_OFF~q\) # (!\Selector7~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L1~q\,
	datab => \current_state.L2~q\,
	datac => \current_state.D_OFF~q\,
	datad => \Selector7~4_combout\,
	combout => \Selector19~0_combout\);

-- Location: LCCOMB_X6_Y49_N28
\Selector19~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector19~1_combout\ = (\current_state.LCD_CLR~q\) # (((!\LessThan1~0_combout\ & \Selector19~0_combout\)) # (!\Selector17~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \current_state.LCD_CLR~q\,
	datac => \Selector17~0_combout\,
	datad => \Selector19~0_combout\,
	combout => \Selector19~1_combout\);

-- Location: LCCOMB_X6_Y49_N24
\Selector19~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector19~2_combout\ = (\LessThan1~0_combout\ & ((\current_state.LCD_CLR~q\) # ((\next_state.ENTRY~q\ & \Selector19~1_combout\)))) # (!\LessThan1~0_combout\ & (((\next_state.ENTRY~q\ & \Selector19~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \current_state.LCD_CLR~q\,
	datac => \next_state.ENTRY~q\,
	datad => \Selector19~1_combout\,
	combout => \Selector19~2_combout\);

-- Location: LCCOMB_X6_Y49_N14
\next_state.ENTRY~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.ENTRY~feeder_combout\ = \Selector19~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector19~2_combout\,
	combout => \next_state.ENTRY~feeder_combout\);

-- Location: FF_X6_Y49_N15
\next_state.ENTRY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \next_state.ENTRY~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.ENTRY~q\);

-- Location: FF_X6_Y49_N27
\current_state.ENTRY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.ENTRY~q\,
	clrn => \clr~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.ENTRY~q\);

-- Location: LCCOMB_X6_Y49_N2
\Selector18~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector18~2_combout\ = (!\LessThan1~0_combout\ & ((\current_state.D_OFF~q\) # ((\current_state.D_ON~q\) # (!\Selector17~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.D_OFF~q\,
	datab => \current_state.D_ON~q\,
	datac => \LessThan1~0_combout\,
	datad => \Selector17~1_combout\,
	combout => \Selector18~2_combout\);

-- Location: LCCOMB_X6_Y49_N6
\Selector18~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector18~3_combout\ = (\next_state.D_ON~q\ & ((\current_state.ENTRY~q\) # ((\Selector18~2_combout\) # (!\Selector17~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.ENTRY~q\,
	datab => \Selector18~2_combout\,
	datac => \next_state.D_ON~q\,
	datad => \Selector17~0_combout\,
	combout => \Selector18~3_combout\);

-- Location: LCCOMB_X6_Y49_N30
\Selector18~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector18~4_combout\ = (\Selector18~3_combout\) # ((\current_state.ENTRY~q\ & ((\LCD:contador[2]~q\) # (\LCD:contador[1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador[2]~q\,
	datab => \current_state.ENTRY~q\,
	datac => \LCD:contador[1]~q\,
	datad => \Selector18~3_combout\,
	combout => \Selector18~4_combout\);

-- Location: FF_X6_Y49_N31
\next_state.D_ON\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector18~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.D_ON~q\);

-- Location: FF_X6_Y49_N13
\current_state.D_ON\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.D_ON~q\,
	clrn => \clr~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.D_ON~q\);

-- Location: LCCOMB_X6_Y49_N20
\Selector25~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector25~2_combout\ = (!\LessThan1~0_combout\ & ((\current_state.D_OFF~q\) # ((\current_state.ENTRY~q\) # (!\Selector17~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.D_OFF~q\,
	datab => \LessThan1~0_combout\,
	datac => \current_state.ENTRY~q\,
	datad => \Selector17~1_combout\,
	combout => \Selector25~2_combout\);

-- Location: LCCOMB_X6_Y49_N10
\Selector25~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector25~3_combout\ = (\next_state.L1~q\ & ((\current_state.D_ON~q\) # ((\Selector25~2_combout\) # (!\Selector17~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.L1~q\,
	datab => \current_state.D_ON~q\,
	datac => \Selector17~0_combout\,
	datad => \Selector25~2_combout\,
	combout => \Selector25~3_combout\);

-- Location: LCCOMB_X6_Y49_N8
\Selector25~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector25~4_combout\ = (\Selector25~3_combout\) # ((\current_state.D_ON~q\ & ((\LCD:contador[1]~q\) # (\LCD:contador[2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector25~3_combout\,
	datab => \current_state.D_ON~q\,
	datac => \LCD:contador[1]~q\,
	datad => \LCD:contador[2]~q\,
	combout => \Selector25~4_combout\);

-- Location: FF_X6_Y49_N9
\next_state.L1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector25~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.L1~q\);

-- Location: FF_X6_Y49_N1
\current_state.L1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.L1~q\,
	clrn => \clr~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.L1~q\);

-- Location: LCCOMB_X3_Y49_N22
\Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~0_combout\ = (!\LessThan1~0_combout\ & ((\current_state.L1~q\) # ((\current_state.L2~q\) # (!\Selector23~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \current_state.L1~q\,
	datac => \current_state.L2~q\,
	datad => \Selector23~0_combout\,
	combout => \Selector21~0_combout\);

-- Location: LCCOMB_X3_Y49_N8
\Selector21~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~2_combout\ = (\next_state.MESG1~q\ & ((\LCD:numMen~0_combout\) # ((\Selector21~0_combout\) # (!\Selector21~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:numMen~0_combout\,
	datab => \next_state.MESG1~q\,
	datac => \Selector21~1_combout\,
	datad => \Selector21~0_combout\,
	combout => \Selector21~2_combout\);

-- Location: LCCOMB_X3_Y49_N28
\Selector21~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~3_combout\ = (\current_state.ASK1~q\) # ((\Selector21~2_combout\) # ((\LessThan1~0_combout\ & \LCD:numMen~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.ASK1~q\,
	datab => \LessThan1~0_combout\,
	datac => \Selector21~2_combout\,
	datad => \LCD:numMen~0_combout\,
	combout => \Selector21~3_combout\);

-- Location: FF_X3_Y49_N29
\next_state.MESG1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector21~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.MESG1~q\);

-- Location: LCCOMB_X3_Y49_N20
\current_state.MESG1~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.MESG1~feeder_combout\ = \next_state.MESG1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_state.MESG1~q\,
	combout => \current_state.MESG1~feeder_combout\);

-- Location: FF_X3_Y49_N21
\current_state.MESG1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \current_state.MESG1~feeder_combout\,
	clrn => \clr~inputclkctrl_outclk\,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.MESG1~q\);

-- Location: LCCOMB_X5_Y49_N6
\LCD:contador[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador[0]~0_combout\ = (!\WideOr2~combout\ & (((!\current_state.MESG2~q\ & !\current_state.MESG1~q\)) # (!\LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG2~q\,
	datab => \current_state.MESG1~q\,
	datac => \LessThan2~0_combout\,
	datad => \WideOr2~combout\,
	combout => \LCD:contador[0]~0_combout\);

-- Location: FF_X5_Y49_N13
\LCD:contador[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector14~0_combout\,
	ena => \LCD:contador[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:contador[0]~q\);

-- Location: LCCOMB_X5_Y49_N16
\Selector12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector12~1_combout\ = (!\current_state.LCD_INI~q\ & (\LCD:contador[1]~q\ & (!\LCD:contador[2]~q\ & \LCD:contador[0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.LCD_INI~q\,
	datab => \LCD:contador[1]~q\,
	datac => \LCD:contador[2]~q\,
	datad => \LCD:contador[0]~q\,
	combout => \Selector12~1_combout\);

-- Location: FF_X5_Y49_N17
\LCD:contador[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector12~1_combout\,
	ena => \LCD:contador[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:contador[2]~q\);

-- Location: LCCOMB_X5_Y49_N26
\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (\LCD:contador[1]~q\) # (\LCD:contador[2]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador[1]~q\,
	datad => \LCD:contador[2]~q\,
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X7_Y49_N2
\Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = (!\Selector12~0_combout\ & ((\LessThan1~0_combout\) # ((\LessThan2~0_combout\) # (\WideOr9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \LessThan2~0_combout\,
	datac => \WideOr9~0_combout\,
	datad => \Selector12~0_combout\,
	combout => \Selector17~0_combout\);

-- Location: LCCOMB_X7_Y49_N22
\Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = (\current_state.L1~q\ & ((\LCD:contador[1]~q\) # (\LCD:contador[2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador[1]~q\,
	datab => \LCD:contador[2]~q\,
	datad => \current_state.L1~q\,
	combout => \Selector20~0_combout\);

-- Location: LCCOMB_X6_Y49_N22
\Selector20~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~1_combout\ = (\current_state.L1~q\) # ((!\LessThan1~0_combout\ & ((\current_state.L2~q\) # (!\Selector23~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \current_state.L2~q\,
	datac => \current_state.L1~q\,
	datad => \Selector23~0_combout\,
	combout => \Selector20~1_combout\);

-- Location: LCCOMB_X7_Y49_N0
\Selector20~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~2_combout\ = (\Selector20~0_combout\) # ((\next_state.ASK1~q\ & ((\Selector20~1_combout\) # (!\Selector17~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.ASK1~q\,
	datab => \Selector17~0_combout\,
	datac => \Selector20~0_combout\,
	datad => \Selector20~1_combout\,
	combout => \Selector20~2_combout\);

-- Location: FF_X7_Y49_N23
\next_state.ASK1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	asdata => \Selector20~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.ASK1~q\);

-- Location: FF_X3_Y49_N19
\current_state.ASK1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.ASK1~q\,
	clrn => \clr~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.ASK1~q\);

-- Location: LCCOMB_X4_Y49_N28
WideOr2 : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr2~combout\ = (\current_state.ASK1~q\) # ((\current_state.ASK3~q\) # (\current_state.ASK2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.ASK1~q\,
	datac => \current_state.ASK3~q\,
	datad => \current_state.ASK2~q\,
	combout => \WideOr2~combout\);

-- Location: LCCOMB_X4_Y49_N18
\next_state.LCD_INI~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.LCD_INI~0_combout\ = (\next_state.LCD_INI~q\) # ((\WideOr2~combout\) # (\Selector16~0_combout\ $ (\Selector16~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.LCD_INI~q\,
	datab => \WideOr2~combout\,
	datac => \Selector16~0_combout\,
	datad => \Selector16~2_combout\,
	combout => \next_state.LCD_INI~0_combout\);

-- Location: LCCOMB_X3_Y49_N16
\next_state.LCD_INI~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.LCD_INI~feeder_combout\ = \next_state.LCD_INI~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_state.LCD_INI~0_combout\,
	combout => \next_state.LCD_INI~feeder_combout\);

-- Location: FF_X3_Y49_N17
\next_state.LCD_INI\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \next_state.LCD_INI~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.LCD_INI~q\);

-- Location: LCCOMB_X3_Y49_N12
\current_state.LCD_INI~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.LCD_INI~feeder_combout\ = \next_state.LCD_INI~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_state.LCD_INI~q\,
	combout => \current_state.LCD_INI~feeder_combout\);

-- Location: FF_X3_Y49_N13
\current_state.LCD_INI\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \current_state.LCD_INI~feeder_combout\,
	clrn => \clr~inputclkctrl_outclk\,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.LCD_INI~q\);

-- Location: LCCOMB_X5_Y49_N10
\Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = (!\LCD:contador[2]~q\ & ((\LCD:contador[1]~q\ & (!\current_state.LCD_INI~q\ & !\LCD:contador[0]~q\)) # (!\LCD:contador[1]~q\ & ((\LCD:contador[0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.LCD_INI~q\,
	datab => \LCD:contador[2]~q\,
	datac => \LCD:contador[1]~q\,
	datad => \LCD:contador[0]~q\,
	combout => \Selector13~0_combout\);

-- Location: FF_X5_Y49_N11
\LCD:contador[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector13~0_combout\,
	ena => \LCD:contador[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:contador[1]~q\);

-- Location: LCCOMB_X7_Y49_N30
\Selector23~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector23~1_combout\ = (\current_state.L2~q\ & ((\LCD:contador[1]~q\) # (\LCD:contador[2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador[1]~q\,
	datab => \LCD:contador[2]~q\,
	datac => \current_state.L2~q\,
	combout => \Selector23~1_combout\);

-- Location: LCCOMB_X7_Y49_N8
\Selector23~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector23~2_combout\ = (\current_state.L2~q\) # ((!\LessThan1~0_combout\ & ((\current_state.L1~q\) # (!\Selector23~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L2~q\,
	datab => \current_state.L1~q\,
	datac => \LessThan1~0_combout\,
	datad => \Selector23~0_combout\,
	combout => \Selector23~2_combout\);

-- Location: LCCOMB_X7_Y49_N26
\Selector23~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector23~3_combout\ = (\Selector23~1_combout\) # ((\next_state.ASK2~q\ & ((\Selector23~2_combout\) # (!\Selector17~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector23~1_combout\,
	datab => \next_state.ASK2~q\,
	datac => \Selector23~2_combout\,
	datad => \Selector17~0_combout\,
	combout => \Selector23~3_combout\);

-- Location: FF_X7_Y49_N5
\next_state.ASK2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	asdata => \Selector23~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.ASK2~q\);

-- Location: LCCOMB_X6_Y49_N18
\current_state.ASK2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.ASK2~feeder_combout\ = \next_state.ASK2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_state.ASK2~q\,
	combout => \current_state.ASK2~feeder_combout\);

-- Location: FF_X6_Y49_N19
\current_state.ASK2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \current_state.ASK2~feeder_combout\,
	clrn => \clr~inputclkctrl_outclk\,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.ASK2~q\);

-- Location: LCCOMB_X7_Y49_N6
\Selector5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~2_combout\ = (\current_state.MESG2~q\ & !\LessThan2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.MESG2~q\,
	datad => \LessThan2~0_combout\,
	combout => \Selector5~2_combout\);

-- Location: LCCOMB_X4_Y49_N22
\Selector22~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector22~1_combout\ = (\next_state.MESG2~q\ & ((\Selector5~2_combout\) # ((\Selector21~0_combout\) # (!\Selector22~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.MESG2~q\,
	datab => \Selector5~2_combout\,
	datac => \Selector22~0_combout\,
	datad => \Selector21~0_combout\,
	combout => \Selector22~1_combout\);

-- Location: LCCOMB_X4_Y49_N8
\Selector22~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector22~2_combout\ = (\current_state.ASK2~q\) # ((\Selector22~1_combout\) # ((\Selector5~2_combout\ & \LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.ASK2~q\,
	datab => \Selector5~2_combout\,
	datac => \Selector22~1_combout\,
	datad => \LessThan1~0_combout\,
	combout => \Selector22~2_combout\);

-- Location: FF_X4_Y49_N9
\next_state.MESG2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector22~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.MESG2~q\);

-- Location: FF_X4_Y49_N25
\current_state.MESG2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.MESG2~q\,
	clrn => \clr~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.MESG2~q\);

-- Location: LCCOMB_X5_Y49_N30
\Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (\datos[0]~reg0_q\ & ((\WideOr2~combout\) # ((\current_state.MESG2~q\ & \LessThan2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG2~q\,
	datab => \datos[0]~reg0_q\,
	datac => \LessThan2~0_combout\,
	datad => \WideOr2~combout\,
	combout => \Selector8~0_combout\);

-- Location: LCCOMB_X8_Y49_N0
\Mux33~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux33~0_combout\ = (\LCD:contador2[0]~q\ & (((\LCD:contador2[1]~q\)))) # (!\LCD:contador2[0]~q\ & ((\LCD:contador2[1]~q\ & ((\a[3]~input_o\))) # (!\LCD:contador2[1]~q\ & (\a[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[5]~input_o\,
	datab => \a[3]~input_o\,
	datac => \LCD:contador2[0]~q\,
	datad => \LCD:contador2[1]~q\,
	combout => \Mux33~0_combout\);

-- Location: LCCOMB_X8_Y49_N18
\Mux33~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux33~1_combout\ = (\LCD:contador2[0]~q\ & ((\Mux33~0_combout\ & ((\a[2]~input_o\))) # (!\Mux33~0_combout\ & (\a[4]~input_o\)))) # (!\LCD:contador2[0]~q\ & (((\Mux33~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[4]~input_o\,
	datab => \a[2]~input_o\,
	datac => \LCD:contador2[0]~q\,
	datad => \Mux33~0_combout\,
	combout => \Mux33~1_combout\);

-- Location: LCCOMB_X8_Y49_N8
\LCD:numMen~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:numMen~1_combout\ = \LCD:numMen~q\ $ (((!\LessThan2~0_combout\ & (\current_state.MESG1~q\ & \LessThan1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~0_combout\,
	datab => \current_state.MESG1~q\,
	datac => \LCD:numMen~q\,
	datad => \LessThan1~0_combout\,
	combout => \LCD:numMen~1_combout\);

-- Location: FF_X8_Y49_N9
\LCD:numMen\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \LCD:numMen~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:numMen~q\);

-- Location: LCCOMB_X8_Y49_N6
\Selector8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~2_combout\ = (\LCD:contador2[0]~q\ & ((\a[0]~input_o\) # ((!\LCD:contador2[3]~q\)))) # (!\LCD:contador2[0]~q\ & (((\a[1]~input_o\ & \LCD:contador2[3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \a[0]~input_o\,
	datac => \a[1]~input_o\,
	datad => \LCD:contador2[3]~q\,
	combout => \Selector8~2_combout\);

-- Location: LCCOMB_X8_Y49_N24
\Selector8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~3_combout\ = (\LCD:contador2[1]~q\ & ((\Selector8~2_combout\ & ((\a[6]~input_o\))) # (!\Selector8~2_combout\ & (\a[7]~input_o\)))) # (!\LCD:contador2[1]~q\ & (((\Selector8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datab => \LCD:contador2[1]~q\,
	datac => \a[6]~input_o\,
	datad => \Selector8~2_combout\,
	combout => \Selector8~3_combout\);

-- Location: LCCOMB_X8_Y49_N26
\Selector8~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~4_combout\ = (\LCD:contador2[3]~q\ & (!\LCD:contador2[1]~q\ & ((\Selector8~3_combout\)))) # (!\LCD:contador2[3]~q\ & ((\Selector8~3_combout\) # ((!\LCD:contador2[1]~q\ & !\LCD:numMen~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[3]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \LCD:numMen~q\,
	datad => \Selector8~3_combout\,
	combout => \Selector8~4_combout\);

-- Location: LCCOMB_X8_Y49_N22
\Selector8~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~6_combout\ = (\LCD:contador2[2]~q\ & (\Mux33~1_combout\ & (!\LCD:contador2[3]~q\))) # (!\LCD:contador2[2]~q\ & (((\Selector8~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \Mux33~1_combout\,
	datac => \LCD:contador2[3]~q\,
	datad => \Selector8~4_combout\,
	combout => \Selector8~6_combout\);

-- Location: LCCOMB_X5_Y48_N4
\Selector8~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~7_combout\ = (\Selector8~6_combout\) # ((\datos[0]~reg0_q\ & \LessThan2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \datos[0]~reg0_q\,
	datac => \LessThan2~0_combout\,
	datad => \Selector8~6_combout\,
	combout => \Selector8~7_combout\);

-- Location: CLKCTRL_G4
\confirm~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \confirm~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \confirm~inputclkctrl_outclk\);

-- Location: LCCOMB_X1_Y48_N2
\acarreo~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \acarreo~4_combout\ = (\b[0]~input_o\ & \a[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b[0]~input_o\,
	datac => \a[0]~input_o\,
	combout => \acarreo~4_combout\);

-- Location: LCCOMB_X7_Y48_N12
\acarreo[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- acarreo(1) = (GLOBAL(\confirm~inputclkctrl_outclk\) & ((acarreo(1)))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & (\acarreo~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \acarreo~4_combout\,
	datac => \confirm~inputclkctrl_outclk\,
	datad => acarreo(1),
	combout => acarreo(1));

-- Location: LCCOMB_X7_Y48_N14
\acarreo~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \acarreo~5_combout\ = (\a[1]~input_o\ & ((\b[1]~input_o\) # (acarreo(1)))) # (!\a[1]~input_o\ & (\b[1]~input_o\ & acarreo(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[1]~input_o\,
	datac => \b[1]~input_o\,
	datad => acarreo(1),
	combout => \acarreo~5_combout\);

-- Location: LCCOMB_X7_Y48_N18
\acarreo[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- acarreo(2) = (GLOBAL(\confirm~inputclkctrl_outclk\) & ((acarreo(2)))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & (\acarreo~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \acarreo~5_combout\,
	datac => acarreo(2),
	datad => \confirm~inputclkctrl_outclk\,
	combout => acarreo(2));

-- Location: LCCOMB_X7_Y48_N24
\acarreo~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \acarreo~6_combout\ = (\a[2]~input_o\ & ((\b[2]~input_o\) # (acarreo(2)))) # (!\a[2]~input_o\ & (\b[2]~input_o\ & acarreo(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datab => \b[2]~input_o\,
	datad => acarreo(2),
	combout => \acarreo~6_combout\);

-- Location: LCCOMB_X3_Y48_N18
\acarreo[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- acarreo(3) = (GLOBAL(\confirm~inputclkctrl_outclk\) & (acarreo(3))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & ((\acarreo~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => acarreo(3),
	datac => \confirm~inputclkctrl_outclk\,
	datad => \acarreo~6_combout\,
	combout => acarreo(3));

-- Location: LCCOMB_X3_Y48_N22
\acarreo~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \acarreo~2_combout\ = (\b[3]~input_o\ & ((\a[3]~input_o\) # (acarreo(3)))) # (!\b[3]~input_o\ & (\a[3]~input_o\ & acarreo(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \a[3]~input_o\,
	datad => acarreo(3),
	combout => \acarreo~2_combout\);

-- Location: LCCOMB_X3_Y48_N20
\acarreo[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- acarreo(4) = (GLOBAL(\confirm~inputclkctrl_outclk\) & ((acarreo(4)))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & (\acarreo~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \acarreo~2_combout\,
	datac => \confirm~inputclkctrl_outclk\,
	datad => acarreo(4),
	combout => acarreo(4));

-- Location: LCCOMB_X3_Y48_N16
\acarreo~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \acarreo~7_combout\ = (\b[4]~input_o\ & ((\a[4]~input_o\) # (acarreo(4)))) # (!\b[4]~input_o\ & (\a[4]~input_o\ & acarreo(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[4]~input_o\,
	datac => \a[4]~input_o\,
	datad => acarreo(4),
	combout => \acarreo~7_combout\);

-- Location: LCCOMB_X4_Y48_N2
\acarreo[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- acarreo(5) = (GLOBAL(\confirm~inputclkctrl_outclk\) & (acarreo(5))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & ((\acarreo~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => acarreo(5),
	datac => \acarreo~7_combout\,
	datad => \confirm~inputclkctrl_outclk\,
	combout => acarreo(5));

-- Location: LCCOMB_X4_Y48_N8
\resultado~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \resultado~7_combout\ = \b[5]~input_o\ $ (\a[5]~input_o\ $ (acarreo(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[5]~input_o\,
	datac => \a[5]~input_o\,
	datad => acarreo(5),
	combout => \resultado~7_combout\);

-- Location: LCCOMB_X5_Y48_N30
\resultado[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- resultado(5) = (GLOBAL(\confirm~inputclkctrl_outclk\) & (resultado(5))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & ((\resultado~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(5),
	datac => \confirm~inputclkctrl_outclk\,
	datad => \resultado~7_combout\,
	combout => resultado(5));

-- Location: LCCOMB_X3_Y48_N24
\resultado~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \resultado~5_combout\ = \b[3]~input_o\ $ (\a[3]~input_o\ $ (acarreo(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[3]~input_o\,
	datab => \a[3]~input_o\,
	datad => acarreo(3),
	combout => \resultado~5_combout\);

-- Location: LCCOMB_X3_Y48_N14
\resultado[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- resultado(3) = (GLOBAL(\confirm~inputclkctrl_outclk\) & (resultado(3))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & ((\resultado~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => resultado(3),
	datac => \confirm~inputclkctrl_outclk\,
	datad => \resultado~5_combout\,
	combout => resultado(3));

-- Location: LCCOMB_X5_Y48_N26
\Mux53~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux53~6_combout\ = (!\LCD:contador2[3]~q\ & ((\LCD:contador2[1]~q\ & ((resultado(3)))) # (!\LCD:contador2[1]~q\ & (resultado(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(5),
	datab => \LCD:contador2[3]~q\,
	datac => \LCD:contador2[1]~q\,
	datad => resultado(3),
	combout => \Mux53~6_combout\);

-- Location: LCCOMB_X4_Y48_N16
\acarreo~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \acarreo~3_combout\ = (\b[5]~input_o\ & ((\a[5]~input_o\) # (acarreo(5)))) # (!\b[5]~input_o\ & (\a[5]~input_o\ & acarreo(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[5]~input_o\,
	datac => \a[5]~input_o\,
	datad => acarreo(5),
	combout => \acarreo~3_combout\);

-- Location: LCCOMB_X4_Y48_N20
\acarreo[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- acarreo(6) = (GLOBAL(\confirm~inputclkctrl_outclk\) & ((acarreo(6)))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & (\acarreo~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \acarreo~3_combout\,
	datac => acarreo(6),
	datad => \confirm~inputclkctrl_outclk\,
	combout => acarreo(6));

-- Location: LCCOMB_X4_Y48_N12
\resultado~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \resultado~1_combout\ = \a[6]~input_o\ $ (\b[6]~input_o\ $ (acarreo(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[6]~input_o\,
	datac => \b[6]~input_o\,
	datad => acarreo(6),
	combout => \resultado~1_combout\);

-- Location: LCCOMB_X5_Y48_N6
\resultado[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- resultado(6) = (GLOBAL(\confirm~inputclkctrl_outclk\) & (resultado(6))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & ((\resultado~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(6),
	datac => \confirm~inputclkctrl_outclk\,
	datad => \resultado~1_combout\,
	combout => resultado(6));

-- Location: LCCOMB_X3_Y48_N6
\resultado~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \resultado~0_combout\ = \b[4]~input_o\ $ (\a[4]~input_o\ $ (acarreo(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[4]~input_o\,
	datac => \a[4]~input_o\,
	datad => acarreo(4),
	combout => \resultado~0_combout\);

-- Location: LCCOMB_X4_Y48_N24
\resultado[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- resultado(4) = (GLOBAL(\confirm~inputclkctrl_outclk\) & (resultado(4))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & ((\resultado~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => resultado(4),
	datac => \resultado~0_combout\,
	datad => \confirm~inputclkctrl_outclk\,
	combout => resultado(4));

-- Location: LCCOMB_X4_Y48_N14
\acarreo~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \acarreo~1_combout\ = (\a[6]~input_o\ & ((\b[6]~input_o\) # (acarreo(6)))) # (!\a[6]~input_o\ & (\b[6]~input_o\ & acarreo(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[6]~input_o\,
	datab => \b[6]~input_o\,
	datad => acarreo(6),
	combout => \acarreo~1_combout\);

-- Location: LCCOMB_X4_Y48_N10
\acarreo[7]\ : cycloneive_lcell_comb
-- Equation(s):
-- acarreo(7) = (GLOBAL(\confirm~inputclkctrl_outclk\) & (acarreo(7))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & ((\acarreo~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => acarreo(7),
	datac => \acarreo~1_combout\,
	datad => \confirm~inputclkctrl_outclk\,
	combout => acarreo(7));

-- Location: LCCOMB_X4_Y48_N22
\resultado~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \resultado~6_combout\ = \a[7]~input_o\ $ (\b[7]~input_o\ $ (acarreo(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datac => \b[7]~input_o\,
	datad => acarreo(7),
	combout => \resultado~6_combout\);

-- Location: LCCOMB_X5_Y48_N16
\resultado[7]\ : cycloneive_lcell_comb
-- Equation(s):
-- resultado(7) = (GLOBAL(\confirm~inputclkctrl_outclk\) & (resultado(7))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & ((\resultado~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => resultado(7),
	datac => \confirm~inputclkctrl_outclk\,
	datad => \resultado~6_combout\,
	combout => resultado(7));

-- Location: LCCOMB_X5_Y48_N20
\Mux45~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux45~0_combout\ = resultado(4) $ (((resultado(7) & ((resultado(6)) # (resultado(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(6),
	datab => resultado(4),
	datac => resultado(5),
	datad => resultado(7),
	combout => \Mux45~0_combout\);

-- Location: LCCOMB_X5_Y48_N22
\Mux53~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux53~7_combout\ = (\Mux53~6_combout\) # ((\LCD:contador2[3]~q\ & (!\LCD:contador2[1]~q\ & \Mux45~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[3]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \Mux53~6_combout\,
	datad => \Mux45~0_combout\,
	combout => \Mux53~7_combout\);

-- Location: LCCOMB_X4_Y48_N30
\acarreo~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \acarreo~0_combout\ = (\a[7]~input_o\ & ((\b[7]~input_o\) # (acarreo(7)))) # (!\a[7]~input_o\ & (\b[7]~input_o\ & acarreo(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datac => \b[7]~input_o\,
	datad => acarreo(7),
	combout => \acarreo~0_combout\);

-- Location: LCCOMB_X4_Y48_N18
\acarreo[8]\ : cycloneive_lcell_comb
-- Equation(s):
-- acarreo(8) = (GLOBAL(\confirm~inputclkctrl_outclk\) & (acarreo(8))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & ((\acarreo~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => acarreo(8),
	datac => \acarreo~0_combout\,
	datad => \confirm~inputclkctrl_outclk\,
	combout => acarreo(8));

-- Location: LCCOMB_X1_Y48_N28
\resultado~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \resultado~2_combout\ = \b[0]~input_o\ $ (\a[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b[0]~input_o\,
	datac => \a[0]~input_o\,
	combout => \resultado~2_combout\);

-- Location: LCCOMB_X7_Y48_N6
\resultado[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- resultado(0) = (GLOBAL(\confirm~inputclkctrl_outclk\) & ((resultado(0)))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & (\resultado~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \resultado~2_combout\,
	datac => \confirm~inputclkctrl_outclk\,
	datad => resultado(0),
	combout => resultado(0));

-- Location: LCCOMB_X7_Y48_N30
\resultado~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \resultado~3_combout\ = \a[1]~input_o\ $ (\b[1]~input_o\ $ (acarreo(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[1]~input_o\,
	datac => \b[1]~input_o\,
	datad => acarreo(1),
	combout => \resultado~3_combout\);

-- Location: LCCOMB_X7_Y48_N0
\resultado[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- resultado(1) = (GLOBAL(\confirm~inputclkctrl_outclk\) & (resultado(1))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & ((\resultado~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => resultado(1),
	datac => \resultado~3_combout\,
	datad => \confirm~inputclkctrl_outclk\,
	combout => resultado(1));

-- Location: LCCOMB_X7_Y48_N8
\resultado~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \resultado~4_combout\ = \a[2]~input_o\ $ (\b[2]~input_o\ $ (acarreo(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datab => \b[2]~input_o\,
	datad => acarreo(2),
	combout => \resultado~4_combout\);

-- Location: LCCOMB_X7_Y48_N22
\resultado[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- resultado(2) = (GLOBAL(\confirm~inputclkctrl_outclk\) & (resultado(2))) # (!GLOBAL(\confirm~inputclkctrl_outclk\) & ((\resultado~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(2),
	datac => \resultado~4_combout\,
	datad => \confirm~inputclkctrl_outclk\,
	combout => resultado(2));

-- Location: LCCOMB_X7_Y48_N28
\Mux39~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~0_combout\ = resultado(0) $ (((resultado(3) & ((resultado(1)) # (resultado(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(0),
	datab => resultado(1),
	datac => resultado(2),
	datad => resultado(3),
	combout => \Mux39~0_combout\);

-- Location: LCCOMB_X5_Y48_N2
\Mux53~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux53~0_combout\ = (\LCD:contador2[1]~q\ & (((resultado(4)) # (\LCD:contador2[3]~q\)))) # (!\LCD:contador2[1]~q\ & (resultado(6) & ((!\LCD:contador2[3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(6),
	datab => resultado(4),
	datac => \LCD:contador2[1]~q\,
	datad => \LCD:contador2[3]~q\,
	combout => \Mux53~0_combout\);

-- Location: LCCOMB_X5_Y48_N8
\Mux53~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux53~1_combout\ = (\LCD:contador2[3]~q\ & ((\Mux53~0_combout\ & ((\Mux39~0_combout\))) # (!\Mux53~0_combout\ & (acarreo(8))))) # (!\LCD:contador2[3]~q\ & (((\Mux53~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[3]~q\,
	datab => acarreo(8),
	datac => \Mux39~0_combout\,
	datad => \Mux53~0_combout\,
	combout => \Mux53~1_combout\);

-- Location: LCCOMB_X5_Y48_N14
\Mux53~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux53~2_combout\ = (\LCD:contador2[1]~q\ & (resultado(7) & ((!\LCD:contador2[3]~q\)))) # (!\LCD:contador2[1]~q\ & (((resultado(1)) # (!\LCD:contador2[3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(7),
	datab => \LCD:contador2[1]~q\,
	datac => resultado(1),
	datad => \LCD:contador2[3]~q\,
	combout => \Mux53~2_combout\);

-- Location: LCCOMB_X7_Y48_N2
\Mux53~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux53~3_combout\ = (\LCD:contador2[3]~q\ & ((\LCD:contador2[1]~q\ & (resultado(0))) # (!\LCD:contador2[1]~q\ & ((resultado(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(0),
	datab => resultado(2),
	datac => \LCD:contador2[3]~q\,
	datad => \LCD:contador2[1]~q\,
	combout => \Mux53~3_combout\);

-- Location: LCCOMB_X7_Y48_N4
\Mux53~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux53~4_combout\ = (\Mux53~3_combout\) # ((!\LCD:contador2[3]~q\ & (\LCD:contador2[1]~q\ & acarreo(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[3]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => acarreo(8),
	datad => \Mux53~3_combout\,
	combout => \Mux53~4_combout\);

-- Location: LCCOMB_X5_Y48_N24
\Mux53~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux53~5_combout\ = (\LCD:contador2[0]~q\ & ((\LCD:contador2[2]~q\) # ((\Mux53~2_combout\)))) # (!\LCD:contador2[0]~q\ & (!\LCD:contador2[2]~q\ & ((\Mux53~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \LCD:contador2[2]~q\,
	datac => \Mux53~2_combout\,
	datad => \Mux53~4_combout\,
	combout => \Mux53~5_combout\);

-- Location: LCCOMB_X5_Y48_N28
\Mux53~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux53~8_combout\ = (\LCD:contador2[2]~q\ & ((\Mux53~5_combout\ & (\Mux53~7_combout\)) # (!\Mux53~5_combout\ & ((\Mux53~1_combout\))))) # (!\LCD:contador2[2]~q\ & (((\Mux53~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux53~7_combout\,
	datab => \LCD:contador2[2]~q\,
	datac => \Mux53~1_combout\,
	datad => \Mux53~5_combout\,
	combout => \Mux53~8_combout\);

-- Location: LCCOMB_X5_Y48_N18
\Selector8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~1_combout\ = (\current_state.D_ON~q\) # ((\current_state.LCD_CLR~q\) # ((\Selector5~2_combout\ & \Mux53~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.D_ON~q\,
	datab => \current_state.LCD_CLR~q\,
	datac => \Selector5~2_combout\,
	datad => \Mux53~8_combout\,
	combout => \Selector8~1_combout\);

-- Location: LCCOMB_X5_Y48_N0
\Selector8~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~5_combout\ = (\Selector8~0_combout\) # ((\Selector8~1_combout\) # ((\current_state.MESG1~q\ & \Selector8~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector8~0_combout\,
	datab => \current_state.MESG1~q\,
	datac => \Selector8~7_combout\,
	datad => \Selector8~1_combout\,
	combout => \Selector8~5_combout\);

-- Location: FF_X5_Y48_N1
\datos[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector8~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \datos[0]~reg0_q\);

-- Location: LCCOMB_X4_Y49_N6
\Selector1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~5_combout\ = (\WideOr2~combout\) # ((\LessThan2~0_combout\ & ((\current_state.MESG2~q\) # (\current_state.MESG1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG2~q\,
	datab => \current_state.MESG1~q\,
	datac => \LessThan2~0_combout\,
	datad => \WideOr2~combout\,
	combout => \Selector1~5_combout\);

-- Location: LCCOMB_X5_Y49_N20
\Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (!\LessThan2~0_combout\ & (\LCD:contador2[1]~q\ & (\LCD:contador2[3]~q\ & \current_state.MESG1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~0_combout\,
	datab => \LCD:contador2[1]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \current_state.MESG1~q\,
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X8_Y48_N22
\Selector5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~3_combout\ = (!\LCD:contador2[2]~q\ & (!\LCD:contador2[3]~q\ & !\LCD:contador2[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \LCD:contador2[1]~q\,
	combout => \Selector5~3_combout\);

-- Location: LCCOMB_X4_Y49_N4
\Selector7~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~6_combout\ = (\current_state.MESG2~q\) # ((\LCD:numMen~q\ & \current_state.MESG1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG2~q\,
	datab => \LCD:numMen~q\,
	datad => \current_state.MESG1~q\,
	combout => \Selector7~6_combout\);

-- Location: LCCOMB_X5_Y49_N14
\Selector7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~1_combout\ = (\LCD:contador2[2]~q\ & (\LCD:contador2[3]~q\ & ((!\LCD:contador2[0]~q\) # (!\LCD:contador2[1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[1]~q\,
	datab => \LCD:contador2[2]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \LCD:contador2[0]~q\,
	combout => \Selector7~1_combout\);

-- Location: LCCOMB_X5_Y48_N12
\Mux44~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux44~0_combout\ = (resultado(7) & ((resultado(5) & ((resultado(4)))) # (!resultado(5) & (resultado(6) & !resultado(4))))) # (!resultado(7) & (((resultado(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(6),
	datab => resultado(7),
	datac => resultado(5),
	datad => resultado(4),
	combout => \Mux44~0_combout\);

-- Location: LCCOMB_X4_Y49_N24
\Selector7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~3_combout\ = (\current_state.MESG1~q\) # ((\LCD:contador2[0]~q\ & (\current_state.MESG2~q\ & \Mux44~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \current_state.MESG1~q\,
	datac => \current_state.MESG2~q\,
	datad => \Mux44~0_combout\,
	combout => \Selector7~3_combout\);

-- Location: LCCOMB_X7_Y48_N10
\Mux38~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux38~0_combout\ = (resultado(0) & (resultado(1))) # (!resultado(0) & ((resultado(1) & ((!resultado(3)))) # (!resultado(1) & (resultado(2) & resultado(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(0),
	datab => resultado(1),
	datac => resultado(2),
	datad => resultado(3),
	combout => \Mux38~0_combout\);

-- Location: LCCOMB_X4_Y49_N16
\Selector7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~2_combout\ = (\current_state.MESG2~q\ & (\LCD:contador2[1]~q\ & ((\LCD:contador2[0]~q\) # (\Mux38~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG2~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \LCD:contador2[0]~q\,
	datad => \Mux38~0_combout\,
	combout => \Selector7~2_combout\);

-- Location: LCCOMB_X4_Y49_N10
\Selector7~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~5_combout\ = ((\Selector7~1_combout\ & ((\Selector7~3_combout\) # (\Selector7~2_combout\)))) # (!\Selector7~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector7~1_combout\,
	datab => \Selector7~3_combout\,
	datac => \Selector7~4_combout\,
	datad => \Selector7~2_combout\,
	combout => \Selector7~5_combout\);

-- Location: LCCOMB_X4_Y49_N20
\Selector7~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~7_combout\ = (\Selector7~5_combout\) # ((\Selector5~3_combout\ & (!\LCD:contador2[0]~q\ & \Selector7~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector5~3_combout\,
	datab => \LCD:contador2[0]~q\,
	datac => \Selector7~6_combout\,
	datad => \Selector7~5_combout\,
	combout => \Selector7~7_combout\);

-- Location: LCCOMB_X4_Y49_N2
\Selector7~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~8_combout\ = (\Selector7~0_combout\) # ((\Selector7~7_combout\) # ((\Selector1~5_combout\ & \datos[1]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector1~5_combout\,
	datab => \Selector7~0_combout\,
	datac => \datos[1]~reg0_q\,
	datad => \Selector7~7_combout\,
	combout => \Selector7~8_combout\);

-- Location: FF_X4_Y49_N3
\datos[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector7~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \datos[1]~reg0_q\);

-- Location: LCCOMB_X8_Y48_N8
\Mux31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux31~0_combout\ = (\LCD:contador2[2]~q\ & (\LCD:contador2[3]~q\)) # (!\LCD:contador2[2]~q\ & ((\LCD:contador2[3]~q\ & (\LCD:contador2[1]~q\)) # (!\LCD:contador2[3]~q\ & (!\LCD:contador2[1]~q\ & \LCD:contador2[0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[3]~q\,
	datac => \LCD:contador2[1]~q\,
	datad => \LCD:contador2[0]~q\,
	combout => \Mux31~0_combout\);

-- Location: LCCOMB_X8_Y48_N30
\Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = ((\current_state.MESG1~q\ & (\Mux31~0_combout\ & !\LessThan2~0_combout\))) # (!\Selector7~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG1~q\,
	datab => \Mux31~0_combout\,
	datac => \Selector7~4_combout\,
	datad => \LessThan2~0_combout\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X8_Y48_N4
\Mux37~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux37~0_combout\ = (resultado(2) & ((resultado(1)) # ((resultado(0)) # (!resultado(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(1),
	datab => resultado(2),
	datac => resultado(0),
	datad => resultado(3),
	combout => \Mux37~0_combout\);

-- Location: LCCOMB_X5_Y48_N10
\Mux43~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux43~0_combout\ = (resultado(6) & (((resultado(5)) # (resultado(4))) # (!resultado(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(6),
	datab => resultado(7),
	datac => resultado(5),
	datad => resultado(4),
	combout => \Mux43~0_combout\);

-- Location: LCCOMB_X8_Y48_N10
\Selector6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (\LCD:contador2[0]~q\ & (!\LCD:contador2[1]~q\ & ((\Mux43~0_combout\)))) # (!\LCD:contador2[0]~q\ & (\LCD:contador2[1]~q\ & (\Mux37~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \Mux37~0_combout\,
	datad => \Mux43~0_combout\,
	combout => \Selector6~1_combout\);

-- Location: LCCOMB_X8_Y48_N28
\Selector6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~2_combout\ = (\LCD:contador2[2]~q\ & (\LCD:contador2[3]~q\ & (\current_state.MESG2~q\ & \Selector6~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[3]~q\,
	datac => \current_state.MESG2~q\,
	datad => \Selector6~1_combout\,
	combout => \Selector6~2_combout\);

-- Location: LCCOMB_X8_Y48_N18
\Selector6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~3_combout\ = (\Selector6~2_combout\) # ((\Selector5~3_combout\ & (\LCD:contador2[0]~q\ & \current_state.MESG2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector5~3_combout\,
	datab => \LCD:contador2[0]~q\,
	datac => \current_state.MESG2~q\,
	datad => \Selector6~2_combout\,
	combout => \Selector6~3_combout\);

-- Location: LCCOMB_X8_Y48_N12
\Selector6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~4_combout\ = (\Selector6~0_combout\) # ((\Selector6~3_combout\) # ((\datos[2]~reg0_q\ & \Selector1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector6~0_combout\,
	datab => \Selector6~3_combout\,
	datac => \datos[2]~reg0_q\,
	datad => \Selector1~5_combout\,
	combout => \Selector6~4_combout\);

-- Location: FF_X8_Y48_N13
\datos[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector6~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \datos[2]~reg0_q\);

-- Location: LCCOMB_X6_Y49_N4
\Selector5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~4_combout\ = (\current_state.D_OFF~q\) # ((\current_state.D_ON~q\) # (!\current_state.LCD_INI~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.D_OFF~q\,
	datab => \current_state.LCD_INI~q\,
	datad => \current_state.D_ON~q\,
	combout => \Selector5~4_combout\);

-- Location: LCCOMB_X8_Y48_N16
\Selector5~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~7_combout\ = (\LCD:contador2[2]~q\ & (\LCD:contador2[1]~q\ & (\LCD:contador2[3]~q\ & resultado(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => resultado(3),
	combout => \Selector5~7_combout\);

-- Location: LCCOMB_X8_Y48_N14
\Selector5~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~8_combout\ = (!resultado(1) & (!resultado(2) & (\Selector5~2_combout\ & \Selector5~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(1),
	datab => resultado(2),
	datac => \Selector5~2_combout\,
	datad => \Selector5~7_combout\,
	combout => \Selector5~8_combout\);

-- Location: LCCOMB_X6_Y48_N28
\Selector5~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~5_combout\ = (resultado(7) & (!resultado(5) & (!resultado(6) & \LCD:contador2[2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(7),
	datab => resultado(5),
	datac => resultado(6),
	datad => \LCD:contador2[2]~q\,
	combout => \Selector5~5_combout\);

-- Location: LCCOMB_X6_Y48_N10
\Selector5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~6_combout\ = (\LCD:contador2[3]~q\ & (((\LCD:contador2[1]~q\) # (\Selector5~5_combout\)))) # (!\LCD:contador2[3]~q\ & (!\LCD:contador2[2]~q\ & (!\LCD:contador2[1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[3]~q\,
	datac => \LCD:contador2[1]~q\,
	datad => \Selector5~5_combout\,
	combout => \Selector5~6_combout\);

-- Location: LCCOMB_X6_Y48_N16
\Selector5~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~11_combout\ = (\LCD:contador2[0]~q\ & (\current_state.MESG2~q\ & (!\LessThan2~0_combout\ & \Selector5~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \current_state.MESG2~q\,
	datac => \LessThan2~0_combout\,
	datad => \Selector5~6_combout\,
	combout => \Selector5~11_combout\);

-- Location: LCCOMB_X8_Y48_N20
\Selector5~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~9_combout\ = (\Selector5~8_combout\) # ((\Selector5~11_combout\) # ((\datos[3]~reg0_q\ & \Selector1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datos[3]~reg0_q\,
	datab => \Selector5~8_combout\,
	datac => \Selector5~11_combout\,
	datad => \Selector1~5_combout\,
	combout => \Selector5~9_combout\);

-- Location: LCCOMB_X8_Y48_N26
\Selector5~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~10_combout\ = (\Selector5~4_combout\) # ((\Selector5~9_combout\) # ((\LCD:numMen~0_combout\ & \Mux31~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:numMen~0_combout\,
	datab => \Selector5~4_combout\,
	datac => \Mux31~0_combout\,
	datad => \Selector5~9_combout\,
	combout => \Selector5~10_combout\);

-- Location: FF_X8_Y48_N27
\datos[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector5~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \datos[3]~reg0_q\);

-- Location: LCCOMB_X6_Y48_N6
\Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\current_state.LCD_INI~q\ & (((!\LCD:contador2[0]~q\ & \Selector5~3_combout\)) # (!\LCD:numMen~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \current_state.LCD_INI~q\,
	datac => \Selector5~3_combout\,
	datad => \LCD:numMen~0_combout\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X6_Y48_N12
\Mux49~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux49~0_combout\ = (resultado(7) & (\LCD:contador2[2]~q\ & ((resultado(5)) # (resultado(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => resultado(7),
	datab => resultado(5),
	datac => resultado(6),
	datad => \LCD:contador2[2]~q\,
	combout => \Mux49~0_combout\);

-- Location: LCCOMB_X7_Y48_N16
\Mux35~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux35~0_combout\ = ((!resultado(1) & !resultado(2))) # (!resultado(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => resultado(1),
	datac => resultado(2),
	datad => resultado(3),
	combout => \Mux35~0_combout\);

-- Location: LCCOMB_X7_Y48_N26
\Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\LCD:contador2[1]~q\ & ((\LCD:contador2[2]~q\ & ((\LCD:contador2[0]~q\) # (\Mux35~0_combout\))) # (!\LCD:contador2[2]~q\ & (!\LCD:contador2[0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[1]~q\,
	datab => \LCD:contador2[2]~q\,
	datac => \LCD:contador2[0]~q\,
	datad => \Mux35~0_combout\,
	combout => \Selector4~0_combout\);

-- Location: LCCOMB_X6_Y48_N22
\Selector4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = (\Selector4~0_combout\) # ((!\LCD:contador2[1]~q\ & ((!\LCD:contador2[0]~q\) # (!\Mux49~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux49~0_combout\,
	datab => \LCD:contador2[0]~q\,
	datac => \LCD:contador2[1]~q\,
	datad => \Selector4~0_combout\,
	combout => \Selector4~1_combout\);

-- Location: LCCOMB_X6_Y48_N24
\Selector4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~2_combout\ = (\datos[4]~reg0_q\ & ((\Selector1~5_combout\) # ((\Selector5~2_combout\ & \Selector4~1_combout\)))) # (!\datos[4]~reg0_q\ & (\Selector5~2_combout\ & (\Selector4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \datos[4]~reg0_q\,
	datab => \Selector5~2_combout\,
	datac => \Selector4~1_combout\,
	datad => \Selector1~5_combout\,
	combout => \Selector4~2_combout\);

-- Location: LCCOMB_X6_Y48_N20
\Selector4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~3_combout\ = ((\Selector4~2_combout\) # ((\current_state.MESG2~q\ & !\LCD:contador2[3]~q\))) # (!\Selector3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector3~0_combout\,
	datab => \current_state.MESG2~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \Selector4~2_combout\,
	combout => \Selector4~3_combout\);

-- Location: FF_X6_Y48_N21
\datos[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector4~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \datos[4]~reg0_q\);

-- Location: LCCOMB_X6_Y48_N8
\Selector3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~3_combout\ = ((\LCD:contador2[0]~q\) # ((\Mux35~0_combout\) # (!\LCD:contador2[3]~q\))) # (!\LCD:contador2[2]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[0]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \Mux35~0_combout\,
	combout => \Selector3~3_combout\);

-- Location: LCCOMB_X6_Y48_N0
\Selector3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\LCD:contador2[3]~q\ & (!\LCD:contador2[1]~q\ & ((!\Mux49~0_combout\) # (!\LCD:contador2[0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \LCD:contador2[3]~q\,
	datac => \LCD:contador2[1]~q\,
	datad => \Mux49~0_combout\,
	combout => \Selector3~1_combout\);

-- Location: LCCOMB_X6_Y48_N30
\Selector3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (\Selector3~1_combout\) # ((!\LCD:contador2[3]~q\ & ((\LCD:contador2[2]~q\) # (\LCD:contador2[0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[0]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \Selector3~1_combout\,
	combout => \Selector3~2_combout\);

-- Location: LCCOMB_X6_Y48_N2
\Selector3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~4_combout\ = (\Selector5~2_combout\ & ((\Selector3~2_combout\) # ((\LCD:contador2[1]~q\ & \Selector3~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[1]~q\,
	datab => \Selector3~3_combout\,
	datac => \Selector3~2_combout\,
	datad => \Selector5~2_combout\,
	combout => \Selector3~4_combout\);

-- Location: LCCOMB_X6_Y48_N26
\Selector3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~5_combout\ = ((\Selector3~4_combout\) # ((\datos[5]~reg0_q\ & \Selector1~5_combout\))) # (!\Selector3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector3~0_combout\,
	datab => \Selector3~4_combout\,
	datac => \datos[5]~reg0_q\,
	datad => \Selector1~5_combout\,
	combout => \Selector3~5_combout\);

-- Location: FF_X6_Y48_N27
\datos[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector3~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \datos[5]~reg0_q\);

-- Location: LCCOMB_X7_Y49_N16
\Mux29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux29~0_combout\ = (\LCD:contador2[2]~q\ & (((!\LCD:contador2[3]~q\)))) # (!\LCD:contador2[2]~q\ & ((\LCD:contador2[1]~q\ & (!\LCD:contador2[3]~q\)) # (!\LCD:contador2[1]~q\ & ((\LCD:contador2[3]~q\) # (\LCD:contador2[0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \LCD:contador2[0]~q\,
	combout => \Mux29~0_combout\);

-- Location: LCCOMB_X7_Y49_N18
\Selector2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~4_combout\ = (\current_state.L2~q\) # ((!\LessThan2~0_combout\ & (\current_state.MESG1~q\ & !\Mux29~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L2~q\,
	datab => \LessThan2~0_combout\,
	datac => \current_state.MESG1~q\,
	datad => \Mux29~0_combout\,
	combout => \Selector2~4_combout\);

-- Location: LCCOMB_X8_Y48_N24
\Selector2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~5_combout\ = (\Selector2~4_combout\) # ((\Selector5~3_combout\ & (\current_state.MESG2~q\ & !\LCD:contador2[0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector5~3_combout\,
	datab => \current_state.MESG2~q\,
	datac => \LCD:contador2[0]~q\,
	datad => \Selector2~4_combout\,
	combout => \Selector2~5_combout\);

-- Location: LCCOMB_X7_Y48_N20
\Selector2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~2_combout\ = (\LCD:contador2[0]~q\ & ((\LCD:contador2[1]~q\) # (\Mux49~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[1]~q\,
	datac => \LCD:contador2[0]~q\,
	datad => \Mux49~0_combout\,
	combout => \Selector2~2_combout\);

-- Location: LCCOMB_X8_Y48_N2
\Selector2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~3_combout\ = (\Selector2~2_combout\) # ((\LCD:contador2[2]~q\ & (\LCD:contador2[1]~q\ & !\Mux35~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \Mux35~0_combout\,
	datad => \Selector2~2_combout\,
	combout => \Selector2~3_combout\);

-- Location: LCCOMB_X8_Y48_N6
\Selector2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~7_combout\ = (!\LessThan2~0_combout\ & (\LCD:contador2[3]~q\ & (\current_state.MESG2~q\ & \Selector2~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~0_combout\,
	datab => \LCD:contador2[3]~q\,
	datac => \current_state.MESG2~q\,
	datad => \Selector2~3_combout\,
	combout => \Selector2~7_combout\);

-- Location: LCCOMB_X8_Y48_N0
\Selector2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~6_combout\ = (\Selector2~5_combout\) # ((\Selector2~7_combout\) # ((\Selector1~5_combout\ & \datos[6]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector1~5_combout\,
	datab => \Selector2~5_combout\,
	datac => \datos[6]~reg0_q\,
	datad => \Selector2~7_combout\,
	combout => \Selector2~6_combout\);

-- Location: FF_X8_Y48_N1
\datos[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector2~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \datos[6]~reg0_q\);

-- Location: LCCOMB_X8_Y49_N14
\Selector1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (\current_state.L1~q\) # ((\current_state.L2~q\) # ((\datos[7]~reg0_q\ & \Selector1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L1~q\,
	datab => \datos[7]~reg0_q\,
	datac => \current_state.L2~q\,
	datad => \Selector1~5_combout\,
	combout => \Selector1~2_combout\);

-- Location: LCCOMB_X7_Y49_N4
\Selector1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~3_combout\ = (!\LCD:contador2[2]~q\ & !\LCD:contador2[1]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datad => \LCD:contador2[1]~q\,
	combout => \Selector1~3_combout\);

-- Location: LCCOMB_X8_Y49_N20
\Selector1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~4_combout\ = (\Selector1~2_combout\) # ((\LCD:numMen~0_combout\ & (\LCD:contador2[3]~q\ & !\Selector1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:numMen~0_combout\,
	datab => \LCD:contador2[3]~q\,
	datac => \Selector1~2_combout\,
	datad => \Selector1~3_combout\,
	combout => \Selector1~4_combout\);

-- Location: FF_X8_Y49_N21
\datos[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \datos[7]~reg0_q\);

-- Location: LCCOMB_X7_Y49_N10
\LCD:EN~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:EN~0_combout\ = !\LCD:EN~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LCD:EN~q\,
	combout => \LCD:EN~0_combout\);

-- Location: LCCOMB_X7_Y49_N14
\E~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \E~1_combout\ = (\LCD:contador[2]~q\) # ((\current_state.LCD_INI~q\ & \LCD:contador[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.LCD_INI~q\,
	datac => \LCD:contador[2]~q\,
	datad => \LCD:contador[1]~q\,
	combout => \E~1_combout\);

-- Location: LCCOMB_X7_Y49_N28
\E~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \E~0_combout\ = (!\current_state.L2~q\ & (!\current_state.L1~q\ & ((\LessThan2~0_combout\) # (\WideOr9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L2~q\,
	datab => \LessThan2~0_combout\,
	datac => \WideOr9~0_combout\,
	datad => \current_state.L1~q\,
	combout => \E~0_combout\);

-- Location: LCCOMB_X7_Y49_N24
\E~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \E~2_combout\ = (\Selector12~0_combout\) # ((!\E~1_combout\ & ((!\E~0_combout\) # (!\Selector23~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector23~0_combout\,
	datab => \Selector12~0_combout\,
	datac => \E~1_combout\,
	datad => \E~0_combout\,
	combout => \E~2_combout\);

-- Location: FF_X7_Y49_N11
\LCD:EN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \LCD:EN~0_combout\,
	ena => \E~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:EN~q\);

-- Location: LCCOMB_X7_Y49_N12
\E~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \E~4_combout\ = !\LCD:EN~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \LCD:EN~q\,
	combout => \E~4_combout\);

-- Location: FF_X7_Y49_N13
\E~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \E~4_combout\,
	ena => \E~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \E~reg0_q\);

-- Location: LCCOMB_X5_Y49_N8
\Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\current_state.ASK3~q\ & (((\confirm~input_o\)))) # (!\current_state.ASK3~q\ & (!\current_state.L2~q\ & ((\current_state.LCD_INI~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.ASK3~q\,
	datab => \current_state.L2~q\,
	datac => \confirm~input_o\,
	datad => \current_state.LCD_INI~q\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X5_Y49_N24
\Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (\current_state.ASK1~q\) # ((\current_state.ASK2~q\) # ((\Selector0~0_combout\ & \RS~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector0~0_combout\,
	datab => \current_state.ASK1~q\,
	datac => \RS~reg0_q\,
	datad => \current_state.ASK2~q\,
	combout => \Selector0~1_combout\);

-- Location: FF_X5_Y49_N25
\RS~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RS~reg0_q\);

ww_D1(0) <= \D1[0]~output_o\;

ww_D1(1) <= \D1[1]~output_o\;

ww_D1(2) <= \D1[2]~output_o\;

ww_D1(3) <= \D1[3]~output_o\;

ww_D1(4) <= \D1[4]~output_o\;

ww_D1(5) <= \D1[5]~output_o\;

ww_D1(6) <= \D1[6]~output_o\;

ww_D2(0) <= \D2[0]~output_o\;

ww_D2(1) <= \D2[1]~output_o\;

ww_D2(2) <= \D2[2]~output_o\;

ww_D2(3) <= \D2[3]~output_o\;

ww_D2(4) <= \D2[4]~output_o\;

ww_D2(5) <= \D2[5]~output_o\;

ww_D2(6) <= \D2[6]~output_o\;

ww_D3(0) <= \D3[0]~output_o\;

ww_D3(1) <= \D3[1]~output_o\;

ww_D3(2) <= \D3[2]~output_o\;

ww_D3(3) <= \D3[3]~output_o\;

ww_D3(4) <= \D3[4]~output_o\;

ww_D3(5) <= \D3[5]~output_o\;

ww_D3(6) <= \D3[6]~output_o\;

ww_D4(0) <= \D4[0]~output_o\;

ww_D4(1) <= \D4[1]~output_o\;

ww_D4(2) <= \D4[2]~output_o\;

ww_D4(3) <= \D4[3]~output_o\;

ww_D4(4) <= \D4[4]~output_o\;

ww_D4(5) <= \D4[5]~output_o\;

ww_D4(6) <= \D4[6]~output_o\;

ww_D5(0) <= \D5[0]~output_o\;

ww_D5(1) <= \D5[1]~output_o\;

ww_D5(2) <= \D5[2]~output_o\;

ww_D5(3) <= \D5[3]~output_o\;

ww_D5(4) <= \D5[4]~output_o\;

ww_D5(5) <= \D5[5]~output_o\;

ww_D5(6) <= \D5[6]~output_o\;

ww_datos(0) <= \datos[0]~output_o\;

ww_datos(1) <= \datos[1]~output_o\;

ww_datos(2) <= \datos[2]~output_o\;

ww_datos(3) <= \datos[3]~output_o\;

ww_datos(4) <= \datos[4]~output_o\;

ww_datos(5) <= \datos[5]~output_o\;

ww_datos(6) <= \datos[6]~output_o\;

ww_datos(7) <= \datos[7]~output_o\;

ww_E <= \E~output_o\;

ww_RS <= \RS~output_o\;

ww_RW <= \RW~output_o\;
END structure;


