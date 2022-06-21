-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 12.1 Build 177 11/07/2012 SJ Web Edition"

-- DATE "06/13/2022 21:03:22"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	VGA_TEST IS
    PORT (
	CLOCK_24 : IN std_logic_vector(1 DOWNTO 0);
	CLOCK_50 : IN std_logic;
	VGA_HS : OUT std_logic;
	VGA_VS : OUT std_logic;
	VGA_CLK : OUT std_logic;
	VGA_R : OUT std_logic_vector(3 DOWNTO 0);
	VGA_G : OUT std_logic_vector(3 DOWNTO 0);
	VGA_B : OUT std_logic_vector(3 DOWNTO 0);
	KEY : IN std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(2 DOWNTO 0)
	);
END VGA_TEST;

-- Design Ports Information
-- CLOCK_24[0]	=>  Location: PIN_AC4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_24[1]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_HS	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_VS	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_CLK	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[0]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[1]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[2]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[3]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[0]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[1]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[2]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[3]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[0]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[1]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[2]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[3]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF VGA_TEST IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_24 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_VGA_HS : std_logic;
SIGNAL ww_VGA_VS : std_logic;
SIGNAL ww_VGA_CLK : std_logic;
SIGNAL ww_VGA_R : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_G : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(2 DOWNTO 0);
SIGNAL \C|altpll_0|sd1|pll7_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \C|altpll_0|sd1|pll7_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \C|altpll_0|sd1|wire_pll7_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \C1|Add1~0_combout\ : std_logic;
SIGNAL \C1|Add1~12_combout\ : std_logic;
SIGNAL \C1|Add1~17\ : std_logic;
SIGNAL \C1|Add1~18_combout\ : std_logic;
SIGNAL \C1|Add0~6_combout\ : std_logic;
SIGNAL \C1|Add0~8_combout\ : std_logic;
SIGNAL \C1|LessThan2~1_cout\ : std_logic;
SIGNAL \C1|LessThan2~3_cout\ : std_logic;
SIGNAL \C1|LessThan2~5_cout\ : std_logic;
SIGNAL \C1|LessThan2~7_cout\ : std_logic;
SIGNAL \C1|LessThan2~9_cout\ : std_logic;
SIGNAL \C1|LessThan2~11_cout\ : std_logic;
SIGNAL \C1|LessThan2~13_cout\ : std_logic;
SIGNAL \C1|LessThan2~15_cout\ : std_logic;
SIGNAL \C1|LessThan2~17_cout\ : std_logic;
SIGNAL \C1|LessThan2~19_cout\ : std_logic;
SIGNAL \C1|LessThan2~20_combout\ : std_logic;
SIGNAL \C1|Add3~1\ : std_logic;
SIGNAL \C1|Add3~0_combout\ : std_logic;
SIGNAL \C1|Add3~3\ : std_logic;
SIGNAL \C1|Add3~2_combout\ : std_logic;
SIGNAL \C1|Add3~5\ : std_logic;
SIGNAL \C1|Add3~4_combout\ : std_logic;
SIGNAL \C1|Add3~7\ : std_logic;
SIGNAL \C1|Add3~6_combout\ : std_logic;
SIGNAL \C1|Add3~9\ : std_logic;
SIGNAL \C1|Add3~8_combout\ : std_logic;
SIGNAL \C1|Add3~11\ : std_logic;
SIGNAL \C1|Add3~10_combout\ : std_logic;
SIGNAL \C1|Add3~13\ : std_logic;
SIGNAL \C1|Add3~12_combout\ : std_logic;
SIGNAL \C1|Add3~15\ : std_logic;
SIGNAL \C1|Add3~14_combout\ : std_logic;
SIGNAL \C1|Add3~17\ : std_logic;
SIGNAL \C1|Add3~16_combout\ : std_logic;
SIGNAL \C1|LessThan7~1_cout\ : std_logic;
SIGNAL \C1|LessThan7~3_cout\ : std_logic;
SIGNAL \C1|LessThan7~5_cout\ : std_logic;
SIGNAL \C1|LessThan7~7_cout\ : std_logic;
SIGNAL \C1|LessThan7~9_cout\ : std_logic;
SIGNAL \C1|LessThan7~11_cout\ : std_logic;
SIGNAL \C1|LessThan7~13_cout\ : std_logic;
SIGNAL \C1|LessThan7~15_cout\ : std_logic;
SIGNAL \C1|LessThan7~17_cout\ : std_logic;
SIGNAL \C1|LessThan7~19_cout\ : std_logic;
SIGNAL \C1|LessThan7~20_combout\ : std_logic;
SIGNAL \C1|Add3~18_combout\ : std_logic;
SIGNAL \C1|Add2~1\ : std_logic;
SIGNAL \C1|Add2~0_combout\ : std_logic;
SIGNAL \C1|Add2~3\ : std_logic;
SIGNAL \C1|Add2~2_combout\ : std_logic;
SIGNAL \C1|Add2~5\ : std_logic;
SIGNAL \C1|Add2~4_combout\ : std_logic;
SIGNAL \C1|Add2~7\ : std_logic;
SIGNAL \C1|Add2~6_combout\ : std_logic;
SIGNAL \C1|Add2~9\ : std_logic;
SIGNAL \C1|Add2~8_combout\ : std_logic;
SIGNAL \C1|Add2~11\ : std_logic;
SIGNAL \C1|Add2~10_combout\ : std_logic;
SIGNAL \C1|Add2~13\ : std_logic;
SIGNAL \C1|Add2~12_combout\ : std_logic;
SIGNAL \C1|Add2~15\ : std_logic;
SIGNAL \C1|Add2~14_combout\ : std_logic;
SIGNAL \C1|LessThan5~1_cout\ : std_logic;
SIGNAL \C1|LessThan5~3_cout\ : std_logic;
SIGNAL \C1|LessThan5~5_cout\ : std_logic;
SIGNAL \C1|LessThan5~7_cout\ : std_logic;
SIGNAL \C1|LessThan5~9_cout\ : std_logic;
SIGNAL \C1|LessThan5~11_cout\ : std_logic;
SIGNAL \C1|LessThan5~13_cout\ : std_logic;
SIGNAL \C1|LessThan5~15_cout\ : std_logic;
SIGNAL \C1|LessThan5~17_cout\ : std_logic;
SIGNAL \C1|LessThan5~19_cout\ : std_logic;
SIGNAL \C1|LessThan5~20_combout\ : std_logic;
SIGNAL \C1|Add2~16_combout\ : std_logic;
SIGNAL \C1|Add5~0_combout\ : std_logic;
SIGNAL \C1|Add5~8_combout\ : std_logic;
SIGNAL \C1|Add5~12_combout\ : std_logic;
SIGNAL \C1|Add5~14_combout\ : std_logic;
SIGNAL \C1|Add5~17\ : std_logic;
SIGNAL \C1|Add5~18_combout\ : std_logic;
SIGNAL \C1|Add4~4_combout\ : std_logic;
SIGNAL \C1|Add4~6_combout\ : std_logic;
SIGNAL \C1|Add4~8_combout\ : std_logic;
SIGNAL \C1|Add4~10_combout\ : std_logic;
SIGNAL \C1|Add4~12_combout\ : std_logic;
SIGNAL \C1|VPOS[3]~17_combout\ : std_logic;
SIGNAL \C1|Add10~1_combout\ : std_logic;
SIGNAL \C1|Add10~3_combout\ : std_logic;
SIGNAL \C1|Add10~7_combout\ : std_logic;
SIGNAL \C1|Add10~11_combout\ : std_logic;
SIGNAL \C1|Add10~15_combout\ : std_logic;
SIGNAL \C1|Add10~17_combout\ : std_logic;
SIGNAL \C1|DRAW2~0_combout\ : std_logic;
SIGNAL \C1|R~0_combout\ : std_logic;
SIGNAL \C1|LessThan20~0_combout\ : std_logic;
SIGNAL \C1|process_0~10_combout\ : std_logic;
SIGNAL \C1|G~0_combout\ : std_logic;
SIGNAL \C1|B~4_combout\ : std_logic;
SIGNAL \C1|SQ_Y1[3]~4_combout\ : std_logic;
SIGNAL \CLOCK_24[0]~input_o\ : std_logic;
SIGNAL \CLOCK_24[1]~input_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \C|altpll_0|sd1|wire_pll7_fbout\ : std_logic;
SIGNAL \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL \C1|HPOS[0]~11_combout\ : std_logic;
SIGNAL \C1|HPOS[6]~23_combout\ : std_logic;
SIGNAL \C1|process_0~8_combout\ : std_logic;
SIGNAL \C1|HPOS[3]~17_combout\ : std_logic;
SIGNAL \C1|LessThan19~0_combout\ : std_logic;
SIGNAL \C1|HPOS[9]~30\ : std_logic;
SIGNAL \C1|HPOS[10]~31_combout\ : std_logic;
SIGNAL \C1|LessThan12~0_combout\ : std_logic;
SIGNAL \C1|HPOS[0]~12\ : std_logic;
SIGNAL \C1|HPOS[1]~13_combout\ : std_logic;
SIGNAL \C1|HPOS[1]~14\ : std_logic;
SIGNAL \C1|HPOS[2]~15_combout\ : std_logic;
SIGNAL \C1|HPOS[2]~16\ : std_logic;
SIGNAL \C1|HPOS[3]~18\ : std_logic;
SIGNAL \C1|HPOS[4]~20\ : std_logic;
SIGNAL \C1|HPOS[5]~21_combout\ : std_logic;
SIGNAL \C1|HPOS[5]~22\ : std_logic;
SIGNAL \C1|HPOS[6]~24\ : std_logic;
SIGNAL \C1|HPOS[7]~25_combout\ : std_logic;
SIGNAL \C1|HPOS[7]~26\ : std_logic;
SIGNAL \C1|HPOS[8]~27_combout\ : std_logic;
SIGNAL \C1|HPOS[8]~28\ : std_logic;
SIGNAL \C1|HPOS[9]~29_combout\ : std_logic;
SIGNAL \C1|process_0~0_combout\ : std_logic;
SIGNAL \C1|process_0~1_combout\ : std_logic;
SIGNAL \C1|HPOS[4]~19_combout\ : std_logic;
SIGNAL \C1|process_0~2_combout\ : std_logic;
SIGNAL \C1|process_0~3_combout\ : std_logic;
SIGNAL \C1|HSYNC~q\ : std_logic;
SIGNAL \C1|VPOS[0]~11_combout\ : std_logic;
SIGNAL \C1|VPOS[7]~26\ : std_logic;
SIGNAL \C1|VPOS[8]~28\ : std_logic;
SIGNAL \C1|VPOS[9]~29_combout\ : std_logic;
SIGNAL \C1|VPOS[9]~30\ : std_logic;
SIGNAL \C1|VPOS[10]~31_combout\ : std_logic;
SIGNAL \C1|LessThan13~0_combout\ : std_logic;
SIGNAL \C1|VPOS[0]~12\ : std_logic;
SIGNAL \C1|VPOS[1]~14\ : std_logic;
SIGNAL \C1|VPOS[2]~16\ : std_logic;
SIGNAL \C1|VPOS[3]~18\ : std_logic;
SIGNAL \C1|VPOS[4]~20\ : std_logic;
SIGNAL \C1|VPOS[5]~21_combout\ : std_logic;
SIGNAL \C1|VPOS[5]~22\ : std_logic;
SIGNAL \C1|VPOS[6]~23_combout\ : std_logic;
SIGNAL \C1|VPOS[6]~24\ : std_logic;
SIGNAL \C1|VPOS[7]~25_combout\ : std_logic;
SIGNAL \C1|process_0~4_combout\ : std_logic;
SIGNAL \C1|VPOS[1]~13_combout\ : std_logic;
SIGNAL \C1|LessThan16~0_combout\ : std_logic;
SIGNAL \C1|process_0~5_combout\ : std_logic;
SIGNAL \C1|vSYNC~q\ : std_logic;
SIGNAL \C|altpll_0|sd1|wire_pll7_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \C1|Add16~1_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \C1|SQ_X3[10]~0_combout\ : std_logic;
SIGNAL \C1|SQ_X3[10]~1_combout\ : std_logic;
SIGNAL \C1|Add16~2\ : std_logic;
SIGNAL \C1|Add16~4\ : std_logic;
SIGNAL \C1|Add16~5_combout\ : std_logic;
SIGNAL \C1|SQ_X3[2]~7_combout\ : std_logic;
SIGNAL \C1|Add16~6\ : std_logic;
SIGNAL \C1|Add16~7_combout\ : std_logic;
SIGNAL \C1|SQ_X3[3]~6_combout\ : std_logic;
SIGNAL \C1|Add16~8\ : std_logic;
SIGNAL \C1|Add16~9_combout\ : std_logic;
SIGNAL \C1|SQ_X3[4]~5_combout\ : std_logic;
SIGNAL \C1|Add16~10\ : std_logic;
SIGNAL \C1|Add16~11_combout\ : std_logic;
SIGNAL \C1|SQ_X3[5]~4_combout\ : std_logic;
SIGNAL \C1|Add16~12\ : std_logic;
SIGNAL \C1|Add16~13_combout\ : std_logic;
SIGNAL \C1|Add16~14\ : std_logic;
SIGNAL \C1|Add16~15_combout\ : std_logic;
SIGNAL \C1|SQ_X3[7]~3_combout\ : std_logic;
SIGNAL \C1|Add16~16\ : std_logic;
SIGNAL \C1|Add16~17_combout\ : std_logic;
SIGNAL \C1|Add16~18\ : std_logic;
SIGNAL \C1|Add16~19_combout\ : std_logic;
SIGNAL \C1|SQ_X3[9]~2_combout\ : std_logic;
SIGNAL \C1|Add16~20\ : std_logic;
SIGNAL \C1|Add16~21_combout\ : std_logic;
SIGNAL \C1|Add16~3_combout\ : std_logic;
SIGNAL \C1|LessThan8~1_cout\ : std_logic;
SIGNAL \C1|LessThan8~3_cout\ : std_logic;
SIGNAL \C1|LessThan8~5_cout\ : std_logic;
SIGNAL \C1|LessThan8~7_cout\ : std_logic;
SIGNAL \C1|LessThan8~9_cout\ : std_logic;
SIGNAL \C1|LessThan8~11_cout\ : std_logic;
SIGNAL \C1|LessThan8~13_cout\ : std_logic;
SIGNAL \C1|LessThan8~15_cout\ : std_logic;
SIGNAL \C1|LessThan8~17_cout\ : std_logic;
SIGNAL \C1|LessThan8~19_cout\ : std_logic;
SIGNAL \C1|LessThan8~20_combout\ : std_logic;
SIGNAL \C1|VPOS[2]~15_combout\ : std_logic;
SIGNAL \C1|VPOS[4]~19_combout\ : std_logic;
SIGNAL \C1|LessThan16~1_combout\ : std_logic;
SIGNAL \C1|process_0~6_combout\ : std_logic;
SIGNAL \C1|process_0~7_combout\ : std_logic;
SIGNAL \C1|process_0~9_combout\ : std_logic;
SIGNAL \C1|B~0_combout\ : std_logic;
SIGNAL \C1|Add4~1\ : std_logic;
SIGNAL \C1|Add4~3\ : std_logic;
SIGNAL \C1|Add4~5\ : std_logic;
SIGNAL \C1|Add4~7\ : std_logic;
SIGNAL \C1|Add4~9\ : std_logic;
SIGNAL \C1|Add4~11\ : std_logic;
SIGNAL \C1|Add4~13\ : std_logic;
SIGNAL \C1|Add4~15\ : std_logic;
SIGNAL \C1|Add4~16_combout\ : std_logic;
SIGNAL \C1|Add18~1_combout\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \C1|SQ_Y3[10]~0_combout\ : std_logic;
SIGNAL \C1|SQ_Y3[10]~1_combout\ : std_logic;
SIGNAL \C1|Add18~2\ : std_logic;
SIGNAL \C1|Add18~3_combout\ : std_logic;
SIGNAL \C1|Add18~4\ : std_logic;
SIGNAL \C1|Add18~5_combout\ : std_logic;
SIGNAL \C1|SQ_Y3[2]~7_combout\ : std_logic;
SIGNAL \C1|Add18~6\ : std_logic;
SIGNAL \C1|Add18~7_combout\ : std_logic;
SIGNAL \C1|SQ_Y3[3]~6_combout\ : std_logic;
SIGNAL \C1|Add18~8\ : std_logic;
SIGNAL \C1|Add18~9_combout\ : std_logic;
SIGNAL \C1|SQ_Y3[4]~5_combout\ : std_logic;
SIGNAL \C1|Add18~10\ : std_logic;
SIGNAL \C1|Add18~11_combout\ : std_logic;
SIGNAL \C1|SQ_Y3[5]~4_combout\ : std_logic;
SIGNAL \C1|Add18~12\ : std_logic;
SIGNAL \C1|Add18~13_combout\ : std_logic;
SIGNAL \C1|Add18~14\ : std_logic;
SIGNAL \C1|Add18~15_combout\ : std_logic;
SIGNAL \C1|SQ_Y3[7]~3_combout\ : std_logic;
SIGNAL \C1|Add18~16\ : std_logic;
SIGNAL \C1|Add18~17_combout\ : std_logic;
SIGNAL \C1|Add18~18\ : std_logic;
SIGNAL \C1|Add18~19_combout\ : std_logic;
SIGNAL \C1|SQ_Y3[9]~2_combout\ : std_logic;
SIGNAL \C1|Add18~20\ : std_logic;
SIGNAL \C1|Add18~21_combout\ : std_logic;
SIGNAL \C1|Add5~1\ : std_logic;
SIGNAL \C1|Add5~3\ : std_logic;
SIGNAL \C1|Add5~5\ : std_logic;
SIGNAL \C1|Add5~7\ : std_logic;
SIGNAL \C1|Add5~9\ : std_logic;
SIGNAL \C1|Add5~11\ : std_logic;
SIGNAL \C1|Add5~13\ : std_logic;
SIGNAL \C1|Add5~15\ : std_logic;
SIGNAL \C1|Add5~16_combout\ : std_logic;
SIGNAL \C1|VPOS[8]~27_combout\ : std_logic;
SIGNAL \C1|Add5~10_combout\ : std_logic;
SIGNAL \C1|Add5~6_combout\ : std_logic;
SIGNAL \C1|Add5~4_combout\ : std_logic;
SIGNAL \C1|Add5~2_combout\ : std_logic;
SIGNAL \C1|LessThan11~1_cout\ : std_logic;
SIGNAL \C1|LessThan11~3_cout\ : std_logic;
SIGNAL \C1|LessThan11~5_cout\ : std_logic;
SIGNAL \C1|LessThan11~7_cout\ : std_logic;
SIGNAL \C1|LessThan11~9_cout\ : std_logic;
SIGNAL \C1|LessThan11~11_cout\ : std_logic;
SIGNAL \C1|LessThan11~13_cout\ : std_logic;
SIGNAL \C1|LessThan11~15_cout\ : std_logic;
SIGNAL \C1|LessThan11~17_cout\ : std_logic;
SIGNAL \C1|LessThan11~19_cout\ : std_logic;
SIGNAL \C1|LessThan11~20_combout\ : std_logic;
SIGNAL \C1|Add4~14_combout\ : std_logic;
SIGNAL \C1|Add4~2_combout\ : std_logic;
SIGNAL \C1|Add4~0_combout\ : std_logic;
SIGNAL \C1|LessThan9~1_cout\ : std_logic;
SIGNAL \C1|LessThan9~3_cout\ : std_logic;
SIGNAL \C1|LessThan9~5_cout\ : std_logic;
SIGNAL \C1|LessThan9~7_cout\ : std_logic;
SIGNAL \C1|LessThan9~9_cout\ : std_logic;
SIGNAL \C1|LessThan9~11_cout\ : std_logic;
SIGNAL \C1|LessThan9~13_cout\ : std_logic;
SIGNAL \C1|LessThan9~15_cout\ : std_logic;
SIGNAL \C1|LessThan9~17_cout\ : std_logic;
SIGNAL \C1|LessThan9~19_cout\ : std_logic;
SIGNAL \C1|LessThan9~20_combout\ : std_logic;
SIGNAL \C1|DRAW3~0_combout\ : std_logic;
SIGNAL \C1|B~2_combout\ : std_logic;
SIGNAL \C1|Add8~1_combout\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \C1|SQ_X1[10]~0_combout\ : std_logic;
SIGNAL \C1|Add8~2\ : std_logic;
SIGNAL \C1|Add8~3_combout\ : std_logic;
SIGNAL \C1|Add8~4\ : std_logic;
SIGNAL \C1|Add8~5_combout\ : std_logic;
SIGNAL \C1|Add8~6\ : std_logic;
SIGNAL \C1|Add8~7_combout\ : std_logic;
SIGNAL \C1|SQ_X1[3]~4_combout\ : std_logic;
SIGNAL \C1|Add8~8\ : std_logic;
SIGNAL \C1|Add8~9_combout\ : std_logic;
SIGNAL \C1|SQ_X1[4]~3_combout\ : std_logic;
SIGNAL \C1|Add8~10\ : std_logic;
SIGNAL \C1|Add8~11_combout\ : std_logic;
SIGNAL \C1|Add8~12\ : std_logic;
SIGNAL \C1|Add8~13_combout\ : std_logic;
SIGNAL \C1|SQ_X1[6]~2_combout\ : std_logic;
SIGNAL \C1|Add8~14\ : std_logic;
SIGNAL \C1|Add8~15_combout\ : std_logic;
SIGNAL \C1|Add8~16\ : std_logic;
SIGNAL \C1|Add8~17_combout\ : std_logic;
SIGNAL \C1|Add8~18\ : std_logic;
SIGNAL \C1|Add8~19_combout\ : std_logic;
SIGNAL \C1|SQ_X1[9]~1_combout\ : std_logic;
SIGNAL \C1|Add8~20\ : std_logic;
SIGNAL \C1|Add8~21_combout\ : std_logic;
SIGNAL \C1|LessThan0~1_cout\ : std_logic;
SIGNAL \C1|LessThan0~3_cout\ : std_logic;
SIGNAL \C1|LessThan0~5_cout\ : std_logic;
SIGNAL \C1|LessThan0~7_cout\ : std_logic;
SIGNAL \C1|LessThan0~9_cout\ : std_logic;
SIGNAL \C1|LessThan0~11_cout\ : std_logic;
SIGNAL \C1|LessThan0~13_cout\ : std_logic;
SIGNAL \C1|LessThan0~15_cout\ : std_logic;
SIGNAL \C1|LessThan0~17_cout\ : std_logic;
SIGNAL \C1|LessThan0~19_cout\ : std_logic;
SIGNAL \C1|LessThan0~20_combout\ : std_logic;
SIGNAL \C1|Add0~1\ : std_logic;
SIGNAL \C1|Add0~3\ : std_logic;
SIGNAL \C1|Add0~5\ : std_logic;
SIGNAL \C1|Add0~7\ : std_logic;
SIGNAL \C1|Add0~9\ : std_logic;
SIGNAL \C1|Add0~11\ : std_logic;
SIGNAL \C1|Add0~13\ : std_logic;
SIGNAL \C1|Add0~15\ : std_logic;
SIGNAL \C1|Add0~16_combout\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \C1|Add10~2\ : std_logic;
SIGNAL \C1|Add10~4\ : std_logic;
SIGNAL \C1|Add10~6\ : std_logic;
SIGNAL \C1|Add10~8\ : std_logic;
SIGNAL \C1|Add10~10\ : std_logic;
SIGNAL \C1|Add10~12\ : std_logic;
SIGNAL \C1|Add10~14\ : std_logic;
SIGNAL \C1|Add10~16\ : std_logic;
SIGNAL \C1|Add10~18\ : std_logic;
SIGNAL \C1|Add10~20\ : std_logic;
SIGNAL \C1|Add10~21_combout\ : std_logic;
SIGNAL \C1|SQ_Y1[10]~0_combout\ : std_logic;
SIGNAL \C1|Add10~19_combout\ : std_logic;
SIGNAL \C1|SQ_Y1[9]~1_combout\ : std_logic;
SIGNAL \C1|Add10~13_combout\ : std_logic;
SIGNAL \C1|SQ_Y1[6]~2_combout\ : std_logic;
SIGNAL \C1|Add10~9_combout\ : std_logic;
SIGNAL \C1|SQ_Y1[4]~3_combout\ : std_logic;
SIGNAL \C1|Add10~5_combout\ : std_logic;
SIGNAL \C1|Add1~1\ : std_logic;
SIGNAL \C1|Add1~3\ : std_logic;
SIGNAL \C1|Add1~5\ : std_logic;
SIGNAL \C1|Add1~7\ : std_logic;
SIGNAL \C1|Add1~9\ : std_logic;
SIGNAL \C1|Add1~11\ : std_logic;
SIGNAL \C1|Add1~13\ : std_logic;
SIGNAL \C1|Add1~15\ : std_logic;
SIGNAL \C1|Add1~16_combout\ : std_logic;
SIGNAL \C1|Add1~14_combout\ : std_logic;
SIGNAL \C1|Add1~10_combout\ : std_logic;
SIGNAL \C1|Add1~8_combout\ : std_logic;
SIGNAL \C1|Add1~6_combout\ : std_logic;
SIGNAL \C1|Add1~4_combout\ : std_logic;
SIGNAL \C1|Add1~2_combout\ : std_logic;
SIGNAL \C1|LessThan3~1_cout\ : std_logic;
SIGNAL \C1|LessThan3~3_cout\ : std_logic;
SIGNAL \C1|LessThan3~5_cout\ : std_logic;
SIGNAL \C1|LessThan3~7_cout\ : std_logic;
SIGNAL \C1|LessThan3~9_cout\ : std_logic;
SIGNAL \C1|LessThan3~11_cout\ : std_logic;
SIGNAL \C1|LessThan3~13_cout\ : std_logic;
SIGNAL \C1|LessThan3~15_cout\ : std_logic;
SIGNAL \C1|LessThan3~17_cout\ : std_logic;
SIGNAL \C1|LessThan3~19_cout\ : std_logic;
SIGNAL \C1|LessThan3~20_combout\ : std_logic;
SIGNAL \C1|Add0~14_combout\ : std_logic;
SIGNAL \C1|Add0~12_combout\ : std_logic;
SIGNAL \C1|Add0~10_combout\ : std_logic;
SIGNAL \C1|Add0~4_combout\ : std_logic;
SIGNAL \C1|Add0~2_combout\ : std_logic;
SIGNAL \C1|Add0~0_combout\ : std_logic;
SIGNAL \C1|LessThan1~1_cout\ : std_logic;
SIGNAL \C1|LessThan1~3_cout\ : std_logic;
SIGNAL \C1|LessThan1~5_cout\ : std_logic;
SIGNAL \C1|LessThan1~7_cout\ : std_logic;
SIGNAL \C1|LessThan1~9_cout\ : std_logic;
SIGNAL \C1|LessThan1~11_cout\ : std_logic;
SIGNAL \C1|LessThan1~13_cout\ : std_logic;
SIGNAL \C1|LessThan1~15_cout\ : std_logic;
SIGNAL \C1|LessThan1~17_cout\ : std_logic;
SIGNAL \C1|LessThan1~19_cout\ : std_logic;
SIGNAL \C1|LessThan1~20_combout\ : std_logic;
SIGNAL \C1|DRAW1~0_combout\ : std_logic;
SIGNAL \C1|DRAW1~1_combout\ : std_logic;
SIGNAL \C1|LessThan10~1_cout\ : std_logic;
SIGNAL \C1|LessThan10~3_cout\ : std_logic;
SIGNAL \C1|LessThan10~5_cout\ : std_logic;
SIGNAL \C1|LessThan10~7_cout\ : std_logic;
SIGNAL \C1|LessThan10~9_cout\ : std_logic;
SIGNAL \C1|LessThan10~11_cout\ : std_logic;
SIGNAL \C1|LessThan10~13_cout\ : std_logic;
SIGNAL \C1|LessThan10~15_cout\ : std_logic;
SIGNAL \C1|LessThan10~17_cout\ : std_logic;
SIGNAL \C1|LessThan10~19_cout\ : std_logic;
SIGNAL \C1|LessThan10~20_combout\ : std_logic;
SIGNAL \C1|DRAW3~1_combout\ : std_logic;
SIGNAL \C1|Add12~2\ : std_logic;
SIGNAL \C1|Add12~3_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \C1|SQ_X2[10]~0_combout\ : std_logic;
SIGNAL \C1|Add12~4\ : std_logic;
SIGNAL \C1|Add12~5_combout\ : std_logic;
SIGNAL \C1|SQ_X2[2]~6_combout\ : std_logic;
SIGNAL \C1|Add12~6\ : std_logic;
SIGNAL \C1|Add12~7_combout\ : std_logic;
SIGNAL \C1|Add12~8\ : std_logic;
SIGNAL \C1|Add12~9_combout\ : std_logic;
SIGNAL \C1|SQ_X2[4]~5_combout\ : std_logic;
SIGNAL \C1|Add12~10\ : std_logic;
SIGNAL \C1|Add12~11_combout\ : std_logic;
SIGNAL \C1|SQ_X2[5]~4_combout\ : std_logic;
SIGNAL \C1|Add12~12\ : std_logic;
SIGNAL \C1|Add12~13_combout\ : std_logic;
SIGNAL \C1|SQ_X2[6]~3_combout\ : std_logic;
SIGNAL \C1|Add12~14\ : std_logic;
SIGNAL \C1|Add12~15_combout\ : std_logic;
SIGNAL \C1|SQ_X2[7]~2_combout\ : std_logic;
SIGNAL \C1|Add12~16\ : std_logic;
SIGNAL \C1|Add12~17_combout\ : std_logic;
SIGNAL \C1|SQ_X2[8]~1_combout\ : std_logic;
SIGNAL \C1|Add12~18\ : std_logic;
SIGNAL \C1|Add12~19_combout\ : std_logic;
SIGNAL \C1|Add12~20\ : std_logic;
SIGNAL \C1|Add12~21_combout\ : std_logic;
SIGNAL \C1|Add12~1_combout\ : std_logic;
SIGNAL \C1|LessThan4~1_cout\ : std_logic;
SIGNAL \C1|LessThan4~3_cout\ : std_logic;
SIGNAL \C1|LessThan4~5_cout\ : std_logic;
SIGNAL \C1|LessThan4~7_cout\ : std_logic;
SIGNAL \C1|LessThan4~9_cout\ : std_logic;
SIGNAL \C1|LessThan4~11_cout\ : std_logic;
SIGNAL \C1|LessThan4~13_cout\ : std_logic;
SIGNAL \C1|LessThan4~15_cout\ : std_logic;
SIGNAL \C1|LessThan4~17_cout\ : std_logic;
SIGNAL \C1|LessThan4~19_cout\ : std_logic;
SIGNAL \C1|LessThan4~20_combout\ : std_logic;
SIGNAL \C1|Add14~2\ : std_logic;
SIGNAL \C1|Add14~3_combout\ : std_logic;
SIGNAL \C1|SQ_Y2[10]~0_combout\ : std_logic;
SIGNAL \C1|Add14~4\ : std_logic;
SIGNAL \C1|Add14~5_combout\ : std_logic;
SIGNAL \C1|SQ_Y2[2]~6_combout\ : std_logic;
SIGNAL \C1|Add14~6\ : std_logic;
SIGNAL \C1|Add14~7_combout\ : std_logic;
SIGNAL \C1|Add14~8\ : std_logic;
SIGNAL \C1|Add14~9_combout\ : std_logic;
SIGNAL \C1|SQ_Y2[4]~5_combout\ : std_logic;
SIGNAL \C1|Add14~10\ : std_logic;
SIGNAL \C1|Add14~11_combout\ : std_logic;
SIGNAL \C1|SQ_Y2[5]~4_combout\ : std_logic;
SIGNAL \C1|Add14~12\ : std_logic;
SIGNAL \C1|Add14~13_combout\ : std_logic;
SIGNAL \C1|SQ_Y2[6]~3_combout\ : std_logic;
SIGNAL \C1|Add14~14\ : std_logic;
SIGNAL \C1|Add14~15_combout\ : std_logic;
SIGNAL \C1|SQ_Y2[7]~2_combout\ : std_logic;
SIGNAL \C1|Add14~16\ : std_logic;
SIGNAL \C1|Add14~17_combout\ : std_logic;
SIGNAL \C1|SQ_Y2[8]~1_combout\ : std_logic;
SIGNAL \C1|Add14~18\ : std_logic;
SIGNAL \C1|Add14~19_combout\ : std_logic;
SIGNAL \C1|Add14~20\ : std_logic;
SIGNAL \C1|Add14~21_combout\ : std_logic;
SIGNAL \C1|Add14~1_combout\ : std_logic;
SIGNAL \C1|LessThan6~1_cout\ : std_logic;
SIGNAL \C1|LessThan6~3_cout\ : std_logic;
SIGNAL \C1|LessThan6~5_cout\ : std_logic;
SIGNAL \C1|LessThan6~7_cout\ : std_logic;
SIGNAL \C1|LessThan6~9_cout\ : std_logic;
SIGNAL \C1|LessThan6~11_cout\ : std_logic;
SIGNAL \C1|LessThan6~13_cout\ : std_logic;
SIGNAL \C1|LessThan6~15_cout\ : std_logic;
SIGNAL \C1|LessThan6~17_cout\ : std_logic;
SIGNAL \C1|LessThan6~19_cout\ : std_logic;
SIGNAL \C1|LessThan6~20_combout\ : std_logic;
SIGNAL \C1|DRAW2~1_combout\ : std_logic;
SIGNAL \C1|B~1_combout\ : std_logic;
SIGNAL \C1|R~1_combout\ : std_logic;
SIGNAL \C1|G~1_combout\ : std_logic;
SIGNAL \C1|B~3_combout\ : std_logic;
SIGNAL \C1|B~5_combout\ : std_logic;
SIGNAL \C|altpll_0|sd1|wire_pll7_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \C1|VPOS\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \C1|SQ_Y3\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \C1|SQ_Y2\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \C1|SQ_Y1\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \C1|SQ_X3\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \C1|SQ_X2\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \C1|SQ_X1\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \C1|R\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \C1|HPOS\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \C1|G\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \C1|B\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_CLOCK_24 <= CLOCK_24;
ww_CLOCK_50 <= CLOCK_50;
VGA_HS <= ww_VGA_HS;
VGA_VS <= ww_VGA_VS;
VGA_CLK <= ww_VGA_CLK;
VGA_R <= ww_VGA_R;
VGA_G <= ww_VGA_G;
VGA_B <= ww_VGA_B;
ww_KEY <= KEY;
ww_SW <= SW;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\C|altpll_0|sd1|pll7_INCLK_bus\ <= (gnd & \CLOCK_50~input_o\);

\C|altpll_0|sd1|wire_pll7_clk\(0) <= \C|altpll_0|sd1|pll7_CLK_bus\(0);
\C|altpll_0|sd1|wire_pll7_clk\(1) <= \C|altpll_0|sd1|pll7_CLK_bus\(1);
\C|altpll_0|sd1|wire_pll7_clk\(2) <= \C|altpll_0|sd1|pll7_CLK_bus\(2);
\C|altpll_0|sd1|wire_pll7_clk\(3) <= \C|altpll_0|sd1|pll7_CLK_bus\(3);
\C|altpll_0|sd1|wire_pll7_clk\(4) <= \C|altpll_0|sd1|pll7_CLK_bus\(4);

\C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \C|altpll_0|sd1|wire_pll7_clk\(1));

\C|altpll_0|sd1|wire_pll7_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \C|altpll_0|sd1|wire_pll7_clk\(0));

-- Location: FF_X60_Y44_N11
\C1|VPOS[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|VPOS[3]~17_combout\,
	sclr => \C1|LessThan13~0_combout\,
	ena => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|VPOS\(3));

-- Location: LCCOMB_X63_Y44_N8
\C1|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add1~0_combout\ = (\C1|SQ_Y1\(1) & (\C1|SQ_Y1\(2) $ (VCC))) # (!\C1|SQ_Y1\(1) & (\C1|SQ_Y1\(2) & VCC))
-- \C1|Add1~1\ = CARRY((\C1|SQ_Y1\(1) & \C1|SQ_Y1\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(1),
	datab => \C1|SQ_Y1\(2),
	datad => VCC,
	combout => \C1|Add1~0_combout\,
	cout => \C1|Add1~1\);

-- Location: LCCOMB_X63_Y44_N20
\C1|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add1~12_combout\ = (\C1|SQ_Y1\(8) & (\C1|Add1~11\ $ (GND))) # (!\C1|SQ_Y1\(8) & (!\C1|Add1~11\ & VCC))
-- \C1|Add1~13\ = CARRY((\C1|SQ_Y1\(8) & !\C1|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(8),
	datad => VCC,
	cin => \C1|Add1~11\,
	combout => \C1|Add1~12_combout\,
	cout => \C1|Add1~13\);

-- Location: LCCOMB_X63_Y44_N24
\C1|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add1~16_combout\ = (\C1|SQ_Y1\(10) & (\C1|Add1~15\ $ (GND))) # (!\C1|SQ_Y1\(10) & (!\C1|Add1~15\ & VCC))
-- \C1|Add1~17\ = CARRY((\C1|SQ_Y1\(10) & !\C1|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y1\(10),
	datad => VCC,
	cin => \C1|Add1~15\,
	combout => \C1|Add1~16_combout\,
	cout => \C1|Add1~17\);

-- Location: LCCOMB_X63_Y44_N26
\C1|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add1~18_combout\ = \C1|Add1~17\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \C1|Add1~17\,
	combout => \C1|Add1~18_combout\);

-- Location: LCCOMB_X58_Y43_N8
\C1|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add0~6_combout\ = (\C1|SQ_X1\(6) & (!\C1|Add0~5\)) # (!\C1|SQ_X1\(6) & (\C1|Add0~5\ & VCC))
-- \C1|Add0~7\ = CARRY((\C1|SQ_X1\(6) & !\C1|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X1\(6),
	datad => VCC,
	cin => \C1|Add0~5\,
	combout => \C1|Add0~6_combout\,
	cout => \C1|Add0~7\);

-- Location: LCCOMB_X58_Y43_N10
\C1|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add0~8_combout\ = (\C1|SQ_X1\(7) & (\C1|Add0~7\ $ (GND))) # (!\C1|SQ_X1\(7) & (!\C1|Add0~7\ & VCC))
-- \C1|Add0~9\ = CARRY((\C1|SQ_X1\(7) & !\C1|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X1\(7),
	datad => VCC,
	cin => \C1|Add0~7\,
	combout => \C1|Add0~8_combout\,
	cout => \C1|Add0~9\);

-- Location: LCCOMB_X63_Y43_N4
\C1|LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan2~1_cout\ = CARRY((\C1|VPOS\(0) & !\C1|SQ_Y1\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(0),
	datab => \C1|SQ_Y1\(0),
	datad => VCC,
	cout => \C1|LessThan2~1_cout\);

-- Location: LCCOMB_X63_Y43_N6
\C1|LessThan2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan2~3_cout\ = CARRY((\C1|SQ_Y1\(1) & ((!\C1|LessThan2~1_cout\) # (!\C1|VPOS\(1)))) # (!\C1|SQ_Y1\(1) & (!\C1|VPOS\(1) & !\C1|LessThan2~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(1),
	datab => \C1|VPOS\(1),
	datad => VCC,
	cin => \C1|LessThan2~1_cout\,
	cout => \C1|LessThan2~3_cout\);

-- Location: LCCOMB_X63_Y43_N8
\C1|LessThan2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan2~5_cout\ = CARRY((\C1|SQ_Y1\(2) & (\C1|VPOS\(2) & !\C1|LessThan2~3_cout\)) # (!\C1|SQ_Y1\(2) & ((\C1|VPOS\(2)) # (!\C1|LessThan2~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(2),
	datab => \C1|VPOS\(2),
	datad => VCC,
	cin => \C1|LessThan2~3_cout\,
	cout => \C1|LessThan2~5_cout\);

-- Location: LCCOMB_X63_Y43_N10
\C1|LessThan2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan2~7_cout\ = CARRY((\C1|SQ_Y1\(3) & (!\C1|VPOS\(3) & !\C1|LessThan2~5_cout\)) # (!\C1|SQ_Y1\(3) & ((!\C1|LessThan2~5_cout\) # (!\C1|VPOS\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(3),
	datab => \C1|VPOS\(3),
	datad => VCC,
	cin => \C1|LessThan2~5_cout\,
	cout => \C1|LessThan2~7_cout\);

-- Location: LCCOMB_X63_Y43_N12
\C1|LessThan2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan2~9_cout\ = CARRY((\C1|VPOS\(4) & ((\C1|SQ_Y1\(4)) # (!\C1|LessThan2~7_cout\))) # (!\C1|VPOS\(4) & (\C1|SQ_Y1\(4) & !\C1|LessThan2~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(4),
	datab => \C1|SQ_Y1\(4),
	datad => VCC,
	cin => \C1|LessThan2~7_cout\,
	cout => \C1|LessThan2~9_cout\);

-- Location: LCCOMB_X63_Y43_N14
\C1|LessThan2~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan2~11_cout\ = CARRY((\C1|SQ_Y1\(5) & ((!\C1|LessThan2~9_cout\) # (!\C1|VPOS\(5)))) # (!\C1|SQ_Y1\(5) & (!\C1|VPOS\(5) & !\C1|LessThan2~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(5),
	datab => \C1|VPOS\(5),
	datad => VCC,
	cin => \C1|LessThan2~9_cout\,
	cout => \C1|LessThan2~11_cout\);

-- Location: LCCOMB_X63_Y43_N16
\C1|LessThan2~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan2~13_cout\ = CARRY((\C1|SQ_Y1\(6) & ((\C1|VPOS\(6)) # (!\C1|LessThan2~11_cout\))) # (!\C1|SQ_Y1\(6) & (\C1|VPOS\(6) & !\C1|LessThan2~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(6),
	datab => \C1|VPOS\(6),
	datad => VCC,
	cin => \C1|LessThan2~11_cout\,
	cout => \C1|LessThan2~13_cout\);

-- Location: LCCOMB_X63_Y43_N18
\C1|LessThan2~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan2~15_cout\ = CARRY((\C1|VPOS\(7) & (\C1|SQ_Y1\(7) & !\C1|LessThan2~13_cout\)) # (!\C1|VPOS\(7) & ((\C1|SQ_Y1\(7)) # (!\C1|LessThan2~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(7),
	datab => \C1|SQ_Y1\(7),
	datad => VCC,
	cin => \C1|LessThan2~13_cout\,
	cout => \C1|LessThan2~15_cout\);

-- Location: LCCOMB_X63_Y43_N20
\C1|LessThan2~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan2~17_cout\ = CARRY((\C1|VPOS\(8) & ((!\C1|LessThan2~15_cout\) # (!\C1|SQ_Y1\(8)))) # (!\C1|VPOS\(8) & (!\C1|SQ_Y1\(8) & !\C1|LessThan2~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(8),
	datab => \C1|SQ_Y1\(8),
	datad => VCC,
	cin => \C1|LessThan2~15_cout\,
	cout => \C1|LessThan2~17_cout\);

-- Location: LCCOMB_X63_Y43_N22
\C1|LessThan2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan2~19_cout\ = CARRY((\C1|VPOS\(9) & (!\C1|SQ_Y1\(9) & !\C1|LessThan2~17_cout\)) # (!\C1|VPOS\(9) & ((!\C1|LessThan2~17_cout\) # (!\C1|SQ_Y1\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(9),
	datab => \C1|SQ_Y1\(9),
	datad => VCC,
	cin => \C1|LessThan2~17_cout\,
	cout => \C1|LessThan2~19_cout\);

-- Location: LCCOMB_X63_Y43_N24
\C1|LessThan2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan2~20_combout\ = (\C1|SQ_Y1\(10) & (!\C1|LessThan2~19_cout\ & \C1|VPOS\(10))) # (!\C1|SQ_Y1\(10) & ((\C1|VPOS\(10)) # (!\C1|LessThan2~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(10),
	datad => \C1|VPOS\(10),
	cin => \C1|LessThan2~19_cout\,
	combout => \C1|LessThan2~20_combout\);

-- Location: LCCOMB_X67_Y44_N10
\C1|Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add3~0_combout\ = (\C1|SQ_Y2\(2) & (\C1|SQ_Y2\(1) & VCC)) # (!\C1|SQ_Y2\(2) & (\C1|SQ_Y2\(1) $ (VCC)))
-- \C1|Add3~1\ = CARRY((!\C1|SQ_Y2\(2) & \C1|SQ_Y2\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y2\(2),
	datab => \C1|SQ_Y2\(1),
	datad => VCC,
	combout => \C1|Add3~0_combout\,
	cout => \C1|Add3~1\);

-- Location: LCCOMB_X67_Y44_N12
\C1|Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add3~2_combout\ = (\C1|SQ_Y2\(3) & (\C1|Add3~1\ & VCC)) # (!\C1|SQ_Y2\(3) & (!\C1|Add3~1\))
-- \C1|Add3~3\ = CARRY((!\C1|SQ_Y2\(3) & !\C1|Add3~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y2\(3),
	datad => VCC,
	cin => \C1|Add3~1\,
	combout => \C1|Add3~2_combout\,
	cout => \C1|Add3~3\);

-- Location: LCCOMB_X67_Y44_N14
\C1|Add3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add3~4_combout\ = (\C1|SQ_Y2\(4) & (!\C1|Add3~3\ & VCC)) # (!\C1|SQ_Y2\(4) & (\C1|Add3~3\ $ (GND)))
-- \C1|Add3~5\ = CARRY((!\C1|SQ_Y2\(4) & !\C1|Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y2\(4),
	datad => VCC,
	cin => \C1|Add3~3\,
	combout => \C1|Add3~4_combout\,
	cout => \C1|Add3~5\);

-- Location: LCCOMB_X67_Y44_N16
\C1|Add3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add3~6_combout\ = (\C1|SQ_Y2\(5) & ((\C1|Add3~5\) # (GND))) # (!\C1|SQ_Y2\(5) & (!\C1|Add3~5\))
-- \C1|Add3~7\ = CARRY((\C1|SQ_Y2\(5)) # (!\C1|Add3~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y2\(5),
	datad => VCC,
	cin => \C1|Add3~5\,
	combout => \C1|Add3~6_combout\,
	cout => \C1|Add3~7\);

-- Location: LCCOMB_X67_Y44_N18
\C1|Add3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add3~8_combout\ = (\C1|SQ_Y2\(6) & (!\C1|Add3~7\ & VCC)) # (!\C1|SQ_Y2\(6) & (\C1|Add3~7\ $ (GND)))
-- \C1|Add3~9\ = CARRY((!\C1|SQ_Y2\(6) & !\C1|Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y2\(6),
	datad => VCC,
	cin => \C1|Add3~7\,
	combout => \C1|Add3~8_combout\,
	cout => \C1|Add3~9\);

-- Location: LCCOMB_X67_Y44_N20
\C1|Add3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add3~10_combout\ = (\C1|SQ_Y2\(7) & ((\C1|Add3~9\) # (GND))) # (!\C1|SQ_Y2\(7) & (!\C1|Add3~9\))
-- \C1|Add3~11\ = CARRY((\C1|SQ_Y2\(7)) # (!\C1|Add3~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y2\(7),
	datad => VCC,
	cin => \C1|Add3~9\,
	combout => \C1|Add3~10_combout\,
	cout => \C1|Add3~11\);

-- Location: LCCOMB_X67_Y44_N22
\C1|Add3~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add3~12_combout\ = (\C1|SQ_Y2\(8) & (!\C1|Add3~11\ & VCC)) # (!\C1|SQ_Y2\(8) & (\C1|Add3~11\ $ (GND)))
-- \C1|Add3~13\ = CARRY((!\C1|SQ_Y2\(8) & !\C1|Add3~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y2\(8),
	datad => VCC,
	cin => \C1|Add3~11\,
	combout => \C1|Add3~12_combout\,
	cout => \C1|Add3~13\);

-- Location: LCCOMB_X67_Y44_N24
\C1|Add3~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add3~14_combout\ = (\C1|SQ_Y2\(9) & (!\C1|Add3~13\)) # (!\C1|SQ_Y2\(9) & ((\C1|Add3~13\) # (GND)))
-- \C1|Add3~15\ = CARRY((!\C1|Add3~13\) # (!\C1|SQ_Y2\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y2\(9),
	datad => VCC,
	cin => \C1|Add3~13\,
	combout => \C1|Add3~14_combout\,
	cout => \C1|Add3~15\);

-- Location: LCCOMB_X67_Y44_N26
\C1|Add3~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add3~16_combout\ = (\C1|SQ_Y2\(10) & (\C1|Add3~15\ $ (GND))) # (!\C1|SQ_Y2\(10) & (!\C1|Add3~15\ & VCC))
-- \C1|Add3~17\ = CARRY((\C1|SQ_Y2\(10) & !\C1|Add3~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y2\(10),
	datad => VCC,
	cin => \C1|Add3~15\,
	combout => \C1|Add3~16_combout\,
	cout => \C1|Add3~17\);

-- Location: LCCOMB_X68_Y44_N10
\C1|LessThan7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan7~1_cout\ = CARRY((!\C1|VPOS\(0) & \C1|SQ_Y2\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(0),
	datab => \C1|SQ_Y2\(0),
	datad => VCC,
	cout => \C1|LessThan7~1_cout\);

-- Location: LCCOMB_X68_Y44_N12
\C1|LessThan7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan7~3_cout\ = CARRY((\C1|VPOS\(1) & ((\C1|SQ_Y2\(1)) # (!\C1|LessThan7~1_cout\))) # (!\C1|VPOS\(1) & (\C1|SQ_Y2\(1) & !\C1|LessThan7~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(1),
	datab => \C1|SQ_Y2\(1),
	datad => VCC,
	cin => \C1|LessThan7~1_cout\,
	cout => \C1|LessThan7~3_cout\);

-- Location: LCCOMB_X68_Y44_N14
\C1|LessThan7~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan7~5_cout\ = CARRY((\C1|Add3~0_combout\ & ((!\C1|LessThan7~3_cout\) # (!\C1|VPOS\(2)))) # (!\C1|Add3~0_combout\ & (!\C1|VPOS\(2) & !\C1|LessThan7~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add3~0_combout\,
	datab => \C1|VPOS\(2),
	datad => VCC,
	cin => \C1|LessThan7~3_cout\,
	cout => \C1|LessThan7~5_cout\);

-- Location: LCCOMB_X68_Y44_N16
\C1|LessThan7~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan7~7_cout\ = CARRY((\C1|Add3~2_combout\ & (\C1|VPOS\(3) & !\C1|LessThan7~5_cout\)) # (!\C1|Add3~2_combout\ & ((\C1|VPOS\(3)) # (!\C1|LessThan7~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add3~2_combout\,
	datab => \C1|VPOS\(3),
	datad => VCC,
	cin => \C1|LessThan7~5_cout\,
	cout => \C1|LessThan7~7_cout\);

-- Location: LCCOMB_X68_Y44_N18
\C1|LessThan7~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan7~9_cout\ = CARRY((\C1|Add3~4_combout\ & ((!\C1|LessThan7~7_cout\) # (!\C1|VPOS\(4)))) # (!\C1|Add3~4_combout\ & (!\C1|VPOS\(4) & !\C1|LessThan7~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add3~4_combout\,
	datab => \C1|VPOS\(4),
	datad => VCC,
	cin => \C1|LessThan7~7_cout\,
	cout => \C1|LessThan7~9_cout\);

-- Location: LCCOMB_X68_Y44_N20
\C1|LessThan7~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan7~11_cout\ = CARRY((\C1|Add3~6_combout\ & (\C1|VPOS\(5) & !\C1|LessThan7~9_cout\)) # (!\C1|Add3~6_combout\ & ((\C1|VPOS\(5)) # (!\C1|LessThan7~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add3~6_combout\,
	datab => \C1|VPOS\(5),
	datad => VCC,
	cin => \C1|LessThan7~9_cout\,
	cout => \C1|LessThan7~11_cout\);

-- Location: LCCOMB_X68_Y44_N22
\C1|LessThan7~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan7~13_cout\ = CARRY((\C1|VPOS\(6) & (\C1|Add3~8_combout\ & !\C1|LessThan7~11_cout\)) # (!\C1|VPOS\(6) & ((\C1|Add3~8_combout\) # (!\C1|LessThan7~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(6),
	datab => \C1|Add3~8_combout\,
	datad => VCC,
	cin => \C1|LessThan7~11_cout\,
	cout => \C1|LessThan7~13_cout\);

-- Location: LCCOMB_X68_Y44_N24
\C1|LessThan7~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan7~15_cout\ = CARRY((\C1|VPOS\(7) & ((!\C1|LessThan7~13_cout\) # (!\C1|Add3~10_combout\))) # (!\C1|VPOS\(7) & (!\C1|Add3~10_combout\ & !\C1|LessThan7~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(7),
	datab => \C1|Add3~10_combout\,
	datad => VCC,
	cin => \C1|LessThan7~13_cout\,
	cout => \C1|LessThan7~15_cout\);

-- Location: LCCOMB_X68_Y44_N26
\C1|LessThan7~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan7~17_cout\ = CARRY((\C1|VPOS\(8) & (\C1|Add3~12_combout\ & !\C1|LessThan7~15_cout\)) # (!\C1|VPOS\(8) & ((\C1|Add3~12_combout\) # (!\C1|LessThan7~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(8),
	datab => \C1|Add3~12_combout\,
	datad => VCC,
	cin => \C1|LessThan7~15_cout\,
	cout => \C1|LessThan7~17_cout\);

-- Location: LCCOMB_X68_Y44_N28
\C1|LessThan7~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan7~19_cout\ = CARRY((\C1|VPOS\(9) & ((!\C1|LessThan7~17_cout\) # (!\C1|Add3~14_combout\))) # (!\C1|VPOS\(9) & (!\C1|Add3~14_combout\ & !\C1|LessThan7~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(9),
	datab => \C1|Add3~14_combout\,
	datad => VCC,
	cin => \C1|LessThan7~17_cout\,
	cout => \C1|LessThan7~19_cout\);

-- Location: LCCOMB_X68_Y44_N30
\C1|LessThan7~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan7~20_combout\ = (\C1|Add3~16_combout\ & ((!\C1|VPOS\(10)) # (!\C1|LessThan7~19_cout\))) # (!\C1|Add3~16_combout\ & (!\C1|LessThan7~19_cout\ & !\C1|VPOS\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add3~16_combout\,
	datad => \C1|VPOS\(10),
	cin => \C1|LessThan7~19_cout\,
	combout => \C1|LessThan7~20_combout\);

-- Location: LCCOMB_X67_Y44_N28
\C1|Add3~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add3~18_combout\ = \C1|Add3~17\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \C1|Add3~17\,
	combout => \C1|Add3~18_combout\);

-- Location: LCCOMB_X68_Y45_N0
\C1|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add2~0_combout\ = (\C1|SQ_X2\(2) & (\C1|SQ_X2\(3) & VCC)) # (!\C1|SQ_X2\(2) & (\C1|SQ_X2\(3) $ (VCC)))
-- \C1|Add2~1\ = CARRY((!\C1|SQ_X2\(2) & \C1|SQ_X2\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X2\(2),
	datab => \C1|SQ_X2\(3),
	datad => VCC,
	combout => \C1|Add2~0_combout\,
	cout => \C1|Add2~1\);

-- Location: LCCOMB_X68_Y45_N2
\C1|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add2~2_combout\ = (\C1|SQ_X2\(4) & ((\C1|Add2~1\) # (GND))) # (!\C1|SQ_X2\(4) & (!\C1|Add2~1\))
-- \C1|Add2~3\ = CARRY((\C1|SQ_X2\(4)) # (!\C1|Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X2\(4),
	datad => VCC,
	cin => \C1|Add2~1\,
	combout => \C1|Add2~2_combout\,
	cout => \C1|Add2~3\);

-- Location: LCCOMB_X68_Y45_N4
\C1|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add2~4_combout\ = (\C1|SQ_X2\(5) & (\C1|Add2~3\ $ (GND))) # (!\C1|SQ_X2\(5) & ((GND) # (!\C1|Add2~3\)))
-- \C1|Add2~5\ = CARRY((!\C1|Add2~3\) # (!\C1|SQ_X2\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X2\(5),
	datad => VCC,
	cin => \C1|Add2~3\,
	combout => \C1|Add2~4_combout\,
	cout => \C1|Add2~5\);

-- Location: LCCOMB_X68_Y45_N6
\C1|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add2~6_combout\ = (\C1|SQ_X2\(6) & (!\C1|Add2~5\)) # (!\C1|SQ_X2\(6) & (\C1|Add2~5\ & VCC))
-- \C1|Add2~7\ = CARRY((\C1|SQ_X2\(6) & !\C1|Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X2\(6),
	datad => VCC,
	cin => \C1|Add2~5\,
	combout => \C1|Add2~6_combout\,
	cout => \C1|Add2~7\);

-- Location: LCCOMB_X68_Y45_N8
\C1|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add2~8_combout\ = (\C1|SQ_X2\(7) & (!\C1|Add2~7\ & VCC)) # (!\C1|SQ_X2\(7) & (\C1|Add2~7\ $ (GND)))
-- \C1|Add2~9\ = CARRY((!\C1|SQ_X2\(7) & !\C1|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X2\(7),
	datad => VCC,
	cin => \C1|Add2~7\,
	combout => \C1|Add2~8_combout\,
	cout => \C1|Add2~9\);

-- Location: LCCOMB_X68_Y45_N10
\C1|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add2~10_combout\ = (\C1|SQ_X2\(8) & ((\C1|Add2~9\) # (GND))) # (!\C1|SQ_X2\(8) & (!\C1|Add2~9\))
-- \C1|Add2~11\ = CARRY((\C1|SQ_X2\(8)) # (!\C1|Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X2\(8),
	datad => VCC,
	cin => \C1|Add2~9\,
	combout => \C1|Add2~10_combout\,
	cout => \C1|Add2~11\);

-- Location: LCCOMB_X68_Y45_N12
\C1|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add2~12_combout\ = (\C1|SQ_X2\(9) & (\C1|Add2~11\ $ (GND))) # (!\C1|SQ_X2\(9) & (!\C1|Add2~11\ & VCC))
-- \C1|Add2~13\ = CARRY((\C1|SQ_X2\(9) & !\C1|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X2\(9),
	datad => VCC,
	cin => \C1|Add2~11\,
	combout => \C1|Add2~12_combout\,
	cout => \C1|Add2~13\);

-- Location: LCCOMB_X68_Y45_N14
\C1|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add2~14_combout\ = (\C1|SQ_X2\(10) & (!\C1|Add2~13\)) # (!\C1|SQ_X2\(10) & ((\C1|Add2~13\) # (GND)))
-- \C1|Add2~15\ = CARRY((!\C1|Add2~13\) # (!\C1|SQ_X2\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X2\(10),
	datad => VCC,
	cin => \C1|Add2~13\,
	combout => \C1|Add2~14_combout\,
	cout => \C1|Add2~15\);

-- Location: LCCOMB_X67_Y45_N10
\C1|LessThan5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan5~1_cout\ = CARRY((!\C1|HPOS\(0) & \C1|SQ_X2\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(0),
	datab => \C1|SQ_X2\(0),
	datad => VCC,
	cout => \C1|LessThan5~1_cout\);

-- Location: LCCOMB_X67_Y45_N12
\C1|LessThan5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan5~3_cout\ = CARRY((\C1|SQ_X2\(1) & (\C1|HPOS\(1) & !\C1|LessThan5~1_cout\)) # (!\C1|SQ_X2\(1) & ((\C1|HPOS\(1)) # (!\C1|LessThan5~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X2\(1),
	datab => \C1|HPOS\(1),
	datad => VCC,
	cin => \C1|LessThan5~1_cout\,
	cout => \C1|LessThan5~3_cout\);

-- Location: LCCOMB_X67_Y45_N14
\C1|LessThan5~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan5~5_cout\ = CARRY((\C1|SQ_X2\(2) & ((!\C1|LessThan5~3_cout\) # (!\C1|HPOS\(2)))) # (!\C1|SQ_X2\(2) & (!\C1|HPOS\(2) & !\C1|LessThan5~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X2\(2),
	datab => \C1|HPOS\(2),
	datad => VCC,
	cin => \C1|LessThan5~3_cout\,
	cout => \C1|LessThan5~5_cout\);

-- Location: LCCOMB_X67_Y45_N16
\C1|LessThan5~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan5~7_cout\ = CARRY((\C1|HPOS\(3) & ((!\C1|LessThan5~5_cout\) # (!\C1|Add2~0_combout\))) # (!\C1|HPOS\(3) & (!\C1|Add2~0_combout\ & !\C1|LessThan5~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(3),
	datab => \C1|Add2~0_combout\,
	datad => VCC,
	cin => \C1|LessThan5~5_cout\,
	cout => \C1|LessThan5~7_cout\);

-- Location: LCCOMB_X67_Y45_N18
\C1|LessThan5~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan5~9_cout\ = CARRY((\C1|Add2~2_combout\ & ((!\C1|LessThan5~7_cout\) # (!\C1|HPOS\(4)))) # (!\C1|Add2~2_combout\ & (!\C1|HPOS\(4) & !\C1|LessThan5~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add2~2_combout\,
	datab => \C1|HPOS\(4),
	datad => VCC,
	cin => \C1|LessThan5~7_cout\,
	cout => \C1|LessThan5~9_cout\);

-- Location: LCCOMB_X67_Y45_N20
\C1|LessThan5~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan5~11_cout\ = CARRY((\C1|Add2~4_combout\ & (\C1|HPOS\(5) & !\C1|LessThan5~9_cout\)) # (!\C1|Add2~4_combout\ & ((\C1|HPOS\(5)) # (!\C1|LessThan5~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add2~4_combout\,
	datab => \C1|HPOS\(5),
	datad => VCC,
	cin => \C1|LessThan5~9_cout\,
	cout => \C1|LessThan5~11_cout\);

-- Location: LCCOMB_X67_Y45_N22
\C1|LessThan5~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan5~13_cout\ = CARRY((\C1|Add2~6_combout\ & ((!\C1|LessThan5~11_cout\) # (!\C1|HPOS\(6)))) # (!\C1|Add2~6_combout\ & (!\C1|HPOS\(6) & !\C1|LessThan5~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add2~6_combout\,
	datab => \C1|HPOS\(6),
	datad => VCC,
	cin => \C1|LessThan5~11_cout\,
	cout => \C1|LessThan5~13_cout\);

-- Location: LCCOMB_X67_Y45_N24
\C1|LessThan5~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan5~15_cout\ = CARRY((\C1|HPOS\(7) & ((!\C1|LessThan5~13_cout\) # (!\C1|Add2~8_combout\))) # (!\C1|HPOS\(7) & (!\C1|Add2~8_combout\ & !\C1|LessThan5~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(7),
	datab => \C1|Add2~8_combout\,
	datad => VCC,
	cin => \C1|LessThan5~13_cout\,
	cout => \C1|LessThan5~15_cout\);

-- Location: LCCOMB_X67_Y45_N26
\C1|LessThan5~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan5~17_cout\ = CARRY((\C1|HPOS\(8) & (\C1|Add2~10_combout\ & !\C1|LessThan5~15_cout\)) # (!\C1|HPOS\(8) & ((\C1|Add2~10_combout\) # (!\C1|LessThan5~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(8),
	datab => \C1|Add2~10_combout\,
	datad => VCC,
	cin => \C1|LessThan5~15_cout\,
	cout => \C1|LessThan5~17_cout\);

-- Location: LCCOMB_X67_Y45_N28
\C1|LessThan5~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan5~19_cout\ = CARRY((\C1|HPOS\(9) & ((!\C1|LessThan5~17_cout\) # (!\C1|Add2~12_combout\))) # (!\C1|HPOS\(9) & (!\C1|Add2~12_combout\ & !\C1|LessThan5~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(9),
	datab => \C1|Add2~12_combout\,
	datad => VCC,
	cin => \C1|LessThan5~17_cout\,
	cout => \C1|LessThan5~19_cout\);

-- Location: LCCOMB_X67_Y45_N30
\C1|LessThan5~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan5~20_combout\ = (\C1|Add2~14_combout\ & ((!\C1|HPOS\(10)) # (!\C1|LessThan5~19_cout\))) # (!\C1|Add2~14_combout\ & (!\C1|LessThan5~19_cout\ & !\C1|HPOS\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|Add2~14_combout\,
	datad => \C1|HPOS\(10),
	cin => \C1|LessThan5~19_cout\,
	combout => \C1|LessThan5~20_combout\);

-- Location: LCCOMB_X68_Y45_N16
\C1|Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add2~16_combout\ = !\C1|Add2~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \C1|Add2~15\,
	combout => \C1|Add2~16_combout\);

-- Location: LCCOMB_X59_Y42_N6
\C1|Add5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add5~0_combout\ = (\C1|SQ_Y3\(2) & (\C1|SQ_Y3\(1) & VCC)) # (!\C1|SQ_Y3\(2) & (\C1|SQ_Y3\(1) $ (VCC)))
-- \C1|Add5~1\ = CARRY((!\C1|SQ_Y3\(2) & \C1|SQ_Y3\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y3\(2),
	datab => \C1|SQ_Y3\(1),
	datad => VCC,
	combout => \C1|Add5~0_combout\,
	cout => \C1|Add5~1\);

-- Location: LCCOMB_X59_Y42_N14
\C1|Add5~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add5~8_combout\ = (\C1|SQ_Y3\(6) & (\C1|Add5~7\ $ (GND))) # (!\C1|SQ_Y3\(6) & (!\C1|Add5~7\ & VCC))
-- \C1|Add5~9\ = CARRY((\C1|SQ_Y3\(6) & !\C1|Add5~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y3\(6),
	datad => VCC,
	cin => \C1|Add5~7\,
	combout => \C1|Add5~8_combout\,
	cout => \C1|Add5~9\);

-- Location: LCCOMB_X59_Y42_N18
\C1|Add5~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add5~12_combout\ = (\C1|SQ_Y3\(8) & (\C1|Add5~11\ $ (GND))) # (!\C1|SQ_Y3\(8) & (!\C1|Add5~11\ & VCC))
-- \C1|Add5~13\ = CARRY((\C1|SQ_Y3\(8) & !\C1|Add5~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y3\(8),
	datad => VCC,
	cin => \C1|Add5~11\,
	combout => \C1|Add5~12_combout\,
	cout => \C1|Add5~13\);

-- Location: LCCOMB_X59_Y42_N20
\C1|Add5~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add5~14_combout\ = (\C1|SQ_Y3\(9) & ((\C1|Add5~13\) # (GND))) # (!\C1|SQ_Y3\(9) & (!\C1|Add5~13\))
-- \C1|Add5~15\ = CARRY((\C1|SQ_Y3\(9)) # (!\C1|Add5~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y3\(9),
	datad => VCC,
	cin => \C1|Add5~13\,
	combout => \C1|Add5~14_combout\,
	cout => \C1|Add5~15\);

-- Location: LCCOMB_X59_Y42_N22
\C1|Add5~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add5~16_combout\ = (\C1|SQ_Y3\(10) & (\C1|Add5~15\ $ (GND))) # (!\C1|SQ_Y3\(10) & (!\C1|Add5~15\ & VCC))
-- \C1|Add5~17\ = CARRY((\C1|SQ_Y3\(10) & !\C1|Add5~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y3\(10),
	datad => VCC,
	cin => \C1|Add5~15\,
	combout => \C1|Add5~16_combout\,
	cout => \C1|Add5~17\);

-- Location: LCCOMB_X59_Y42_N24
\C1|Add5~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add5~18_combout\ = \C1|Add5~17\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \C1|Add5~17\,
	combout => \C1|Add5~18_combout\);

-- Location: LCCOMB_X61_Y45_N8
\C1|Add4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add4~4_combout\ = (\C1|SQ_X3\(5) & (\C1|Add4~3\ $ (GND))) # (!\C1|SQ_X3\(5) & ((GND) # (!\C1|Add4~3\)))
-- \C1|Add4~5\ = CARRY((!\C1|Add4~3\) # (!\C1|SQ_X3\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X3\(5),
	datad => VCC,
	cin => \C1|Add4~3\,
	combout => \C1|Add4~4_combout\,
	cout => \C1|Add4~5\);

-- Location: LCCOMB_X61_Y45_N10
\C1|Add4~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add4~6_combout\ = (\C1|SQ_X3\(6) & (\C1|Add4~5\ & VCC)) # (!\C1|SQ_X3\(6) & (!\C1|Add4~5\))
-- \C1|Add4~7\ = CARRY((!\C1|SQ_X3\(6) & !\C1|Add4~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X3\(6),
	datad => VCC,
	cin => \C1|Add4~5\,
	combout => \C1|Add4~6_combout\,
	cout => \C1|Add4~7\);

-- Location: LCCOMB_X61_Y45_N12
\C1|Add4~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add4~8_combout\ = (\C1|SQ_X3\(7) & (!\C1|Add4~7\ & VCC)) # (!\C1|SQ_X3\(7) & (\C1|Add4~7\ $ (GND)))
-- \C1|Add4~9\ = CARRY((!\C1|SQ_X3\(7) & !\C1|Add4~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X3\(7),
	datad => VCC,
	cin => \C1|Add4~7\,
	combout => \C1|Add4~8_combout\,
	cout => \C1|Add4~9\);

-- Location: LCCOMB_X61_Y45_N14
\C1|Add4~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add4~10_combout\ = (\C1|SQ_X3\(8) & (!\C1|Add4~9\)) # (!\C1|SQ_X3\(8) & ((\C1|Add4~9\) # (GND)))
-- \C1|Add4~11\ = CARRY((!\C1|Add4~9\) # (!\C1|SQ_X3\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X3\(8),
	datad => VCC,
	cin => \C1|Add4~9\,
	combout => \C1|Add4~10_combout\,
	cout => \C1|Add4~11\);

-- Location: LCCOMB_X61_Y45_N16
\C1|Add4~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add4~12_combout\ = (\C1|SQ_X3\(9) & (!\C1|Add4~11\ & VCC)) # (!\C1|SQ_X3\(9) & (\C1|Add4~11\ $ (GND)))
-- \C1|Add4~13\ = CARRY((!\C1|SQ_X3\(9) & !\C1|Add4~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X3\(9),
	datad => VCC,
	cin => \C1|Add4~11\,
	combout => \C1|Add4~12_combout\,
	cout => \C1|Add4~13\);

-- Location: LCCOMB_X60_Y44_N10
\C1|VPOS[3]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|VPOS[3]~17_combout\ = (\C1|VPOS\(3) & (!\C1|VPOS[2]~16\)) # (!\C1|VPOS\(3) & ((\C1|VPOS[2]~16\) # (GND)))
-- \C1|VPOS[3]~18\ = CARRY((!\C1|VPOS[2]~16\) # (!\C1|VPOS\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(3),
	datad => VCC,
	cin => \C1|VPOS[2]~16\,
	combout => \C1|VPOS[3]~17_combout\,
	cout => \C1|VPOS[3]~18\);

-- Location: LCCOMB_X62_Y43_N6
\C1|Add10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add10~1_combout\ = \C1|SQ_Y1\(0) $ (VCC)
-- \C1|Add10~2\ = CARRY(\C1|SQ_Y1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(0),
	datad => VCC,
	combout => \C1|Add10~1_combout\,
	cout => \C1|Add10~2\);

-- Location: LCCOMB_X62_Y43_N8
\C1|Add10~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add10~3_combout\ = (\C1|SQ_Y1\(1) & ((\KEY[3]~input_o\ & (!\C1|Add10~2\)) # (!\KEY[3]~input_o\ & (\C1|Add10~2\ & VCC)))) # (!\C1|SQ_Y1\(1) & ((\KEY[3]~input_o\ & ((\C1|Add10~2\) # (GND))) # (!\KEY[3]~input_o\ & (!\C1|Add10~2\))))
-- \C1|Add10~4\ = CARRY((\C1|SQ_Y1\(1) & (\KEY[3]~input_o\ & !\C1|Add10~2\)) # (!\C1|SQ_Y1\(1) & ((\KEY[3]~input_o\) # (!\C1|Add10~2\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(1),
	datab => \KEY[3]~input_o\,
	datad => VCC,
	cin => \C1|Add10~2\,
	combout => \C1|Add10~3_combout\,
	cout => \C1|Add10~4\);

-- Location: LCCOMB_X62_Y43_N12
\C1|Add10~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add10~7_combout\ = (\C1|SQ_Y1\(3) & ((\KEY[3]~input_o\ & ((\C1|Add10~6\) # (GND))) # (!\KEY[3]~input_o\ & (!\C1|Add10~6\)))) # (!\C1|SQ_Y1\(3) & ((\KEY[3]~input_o\ & (!\C1|Add10~6\)) # (!\KEY[3]~input_o\ & (\C1|Add10~6\ & VCC))))
-- \C1|Add10~8\ = CARRY((\C1|SQ_Y1\(3) & ((\KEY[3]~input_o\) # (!\C1|Add10~6\))) # (!\C1|SQ_Y1\(3) & (\KEY[3]~input_o\ & !\C1|Add10~6\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(3),
	datab => \KEY[3]~input_o\,
	datad => VCC,
	cin => \C1|Add10~6\,
	combout => \C1|Add10~7_combout\,
	cout => \C1|Add10~8\);

-- Location: LCCOMB_X62_Y43_N16
\C1|Add10~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add10~11_combout\ = (\C1|SQ_Y1\(5) & ((\KEY[3]~input_o\ & (!\C1|Add10~10\)) # (!\KEY[3]~input_o\ & (\C1|Add10~10\ & VCC)))) # (!\C1|SQ_Y1\(5) & ((\KEY[3]~input_o\ & ((\C1|Add10~10\) # (GND))) # (!\KEY[3]~input_o\ & (!\C1|Add10~10\))))
-- \C1|Add10~12\ = CARRY((\C1|SQ_Y1\(5) & (\KEY[3]~input_o\ & !\C1|Add10~10\)) # (!\C1|SQ_Y1\(5) & ((\KEY[3]~input_o\) # (!\C1|Add10~10\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(5),
	datab => \KEY[3]~input_o\,
	datad => VCC,
	cin => \C1|Add10~10\,
	combout => \C1|Add10~11_combout\,
	cout => \C1|Add10~12\);

-- Location: LCCOMB_X62_Y43_N20
\C1|Add10~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add10~15_combout\ = (\C1|SQ_Y1\(7) & ((\KEY[3]~input_o\ & (!\C1|Add10~14\)) # (!\KEY[3]~input_o\ & (\C1|Add10~14\ & VCC)))) # (!\C1|SQ_Y1\(7) & ((\KEY[3]~input_o\ & ((\C1|Add10~14\) # (GND))) # (!\KEY[3]~input_o\ & (!\C1|Add10~14\))))
-- \C1|Add10~16\ = CARRY((\C1|SQ_Y1\(7) & (\KEY[3]~input_o\ & !\C1|Add10~14\)) # (!\C1|SQ_Y1\(7) & ((\KEY[3]~input_o\) # (!\C1|Add10~14\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(7),
	datab => \KEY[3]~input_o\,
	datad => VCC,
	cin => \C1|Add10~14\,
	combout => \C1|Add10~15_combout\,
	cout => \C1|Add10~16\);

-- Location: LCCOMB_X62_Y43_N22
\C1|Add10~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add10~17_combout\ = ((\C1|SQ_Y1\(8) $ (\KEY[3]~input_o\ $ (\C1|Add10~16\)))) # (GND)
-- \C1|Add10~18\ = CARRY((\C1|SQ_Y1\(8) & ((!\C1|Add10~16\) # (!\KEY[3]~input_o\))) # (!\C1|SQ_Y1\(8) & (!\KEY[3]~input_o\ & !\C1|Add10~16\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(8),
	datab => \KEY[3]~input_o\,
	datad => VCC,
	cin => \C1|Add10~16\,
	combout => \C1|Add10~17_combout\,
	cout => \C1|Add10~18\);

-- Location: FF_X62_Y43_N23
\C1|SQ_Y1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add10~17_combout\,
	ena => \C1|SQ_Y1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y1\(8));

-- Location: FF_X62_Y43_N21
\C1|SQ_Y1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add10~15_combout\,
	ena => \C1|SQ_Y1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y1\(7));

-- Location: FF_X62_Y43_N17
\C1|SQ_Y1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add10~11_combout\,
	ena => \C1|SQ_Y1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y1\(5));

-- Location: FF_X63_Y44_N31
\C1|SQ_Y1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y1[3]~4_combout\,
	ena => \C1|SQ_Y1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y1\(3));

-- Location: FF_X62_Y43_N9
\C1|SQ_Y1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add10~3_combout\,
	ena => \C1|SQ_Y1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y1\(1));

-- Location: FF_X62_Y43_N7
\C1|SQ_Y1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add10~1_combout\,
	ena => \C1|SQ_Y1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y1\(0));

-- Location: LCCOMB_X61_Y44_N10
\C1|DRAW2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|DRAW2~0_combout\ = (\C1|Add2~16_combout\ & ((\C1|Add3~18_combout\) # ((\C1|LessThan7~20_combout\)))) # (!\C1|Add2~16_combout\ & (\C1|LessThan5~20_combout\ & ((\C1|Add3~18_combout\) # (\C1|LessThan7~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add2~16_combout\,
	datab => \C1|Add3~18_combout\,
	datac => \C1|LessThan5~20_combout\,
	datad => \C1|LessThan7~20_combout\,
	combout => \C1|DRAW2~0_combout\);

-- Location: LCCOMB_X61_Y44_N22
\C1|R~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|R~0_combout\ = (\C1|DRAW2~1_combout\ & (!\SW[1]~input_o\)) # (!\C1|DRAW2~1_combout\ & (((\C1|R\(0)) # (\C1|DRAW1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \C1|R\(0),
	datac => \C1|DRAW1~1_combout\,
	datad => \C1|DRAW2~1_combout\,
	combout => \C1|R~0_combout\);

-- Location: LCCOMB_X60_Y44_N26
\C1|LessThan20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan20~0_combout\ = (!\C1|VPOS\(4) & (((!\C1|VPOS\(1) & !\C1|VPOS\(2))) # (!\C1|VPOS\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(1),
	datab => \C1|VPOS\(4),
	datac => \C1|VPOS\(2),
	datad => \C1|VPOS\(3),
	combout => \C1|LessThan20~0_combout\);

-- Location: LCCOMB_X59_Y45_N28
\C1|process_0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|process_0~10_combout\ = (!\C1|HPOS\(4) & (\C1|process_0~8_combout\ & (!\C1|HPOS\(8) & !\C1|HPOS\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(4),
	datab => \C1|process_0~8_combout\,
	datac => \C1|HPOS\(8),
	datad => \C1|HPOS\(7),
	combout => \C1|process_0~10_combout\);

-- Location: LCCOMB_X61_Y44_N26
\C1|G~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|G~0_combout\ = (\C1|DRAW2~1_combout\) # ((\C1|DRAW1~1_combout\ & ((!\SW[0]~input_o\))) # (!\C1|DRAW1~1_combout\ & (\C1|G\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|G\(0),
	datab => \C1|DRAW1~1_combout\,
	datac => \SW[0]~input_o\,
	datad => \C1|DRAW2~1_combout\,
	combout => \C1|G~0_combout\);

-- Location: LCCOMB_X61_Y44_N30
\C1|B~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|B~4_combout\ = (!\C1|DRAW2~1_combout\ & ((\C1|DRAW1~1_combout\ & ((!\SW[0]~input_o\))) # (!\C1|DRAW1~1_combout\ & (\C1|B\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|B\(0),
	datab => \C1|DRAW1~1_combout\,
	datac => \SW[0]~input_o\,
	datad => \C1|DRAW2~1_combout\,
	combout => \C1|B~4_combout\);

-- Location: LCCOMB_X63_Y44_N30
\C1|SQ_Y1[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y1[3]~4_combout\ = !\C1|Add10~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|Add10~7_combout\,
	combout => \C1|SQ_Y1[3]~4_combout\);

-- Location: IOOBUF_X38_Y73_N16
\VGA_HS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|HSYNC~q\,
	devoe => ww_devoe,
	o => ww_VGA_HS);

-- Location: IOOBUF_X54_Y73_N2
\VGA_VS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|vSYNC~q\,
	devoe => ww_devoe,
	o => ww_VGA_VS);

-- Location: IOOBUF_X47_Y73_N2
\VGA_CLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C|altpll_0|sd1|wire_pll7_clk[0]~clkctrl_outclk\,
	devoe => ww_devoe,
	o => ww_VGA_CLK);

-- Location: IOOBUF_X33_Y73_N2
\VGA_R[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|R\(0),
	devoe => ww_devoe,
	o => ww_VGA_R(0));

-- Location: IOOBUF_X31_Y73_N2
\VGA_R[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|R\(0),
	devoe => ww_devoe,
	o => ww_VGA_R(1));

-- Location: IOOBUF_X35_Y73_N23
\VGA_R[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|R\(0),
	devoe => ww_devoe,
	o => ww_VGA_R(2));

-- Location: IOOBUF_X33_Y73_N9
\VGA_R[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|R\(0),
	devoe => ww_devoe,
	o => ww_VGA_R(3));

-- Location: IOOBUF_X11_Y73_N16
\VGA_G[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|G\(0),
	devoe => ww_devoe,
	o => ww_VGA_G(0));

-- Location: IOOBUF_X25_Y73_N16
\VGA_G[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|G\(0),
	devoe => ww_devoe,
	o => ww_VGA_G(1));

-- Location: IOOBUF_X11_Y73_N9
\VGA_G[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|G\(0),
	devoe => ww_devoe,
	o => ww_VGA_G(2));

-- Location: IOOBUF_X25_Y73_N23
\VGA_G[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|G\(0),
	devoe => ww_devoe,
	o => ww_VGA_G(3));

-- Location: IOOBUF_X38_Y73_N9
\VGA_B[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|B\(0),
	devoe => ww_devoe,
	o => ww_VGA_B(0));

-- Location: IOOBUF_X38_Y73_N2
\VGA_B[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|B\(0),
	devoe => ww_devoe,
	o => ww_VGA_B(1));

-- Location: IOOBUF_X23_Y73_N2
\VGA_B[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|B\(0),
	devoe => ww_devoe,
	o => ww_VGA_B(2));

-- Location: IOOBUF_X42_Y73_N9
\VGA_B[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \C1|B\(0),
	devoe => ww_devoe,
	o => ww_VGA_B(3));

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: PLL_1
\C|altpll_0|sd1|pll7\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 3,
	c0_initial => 1,
	c0_low => 2,
	c0_mode => "odd",
	c0_ph => 0,
	c1_high => 3,
	c1_initial => 1,
	c1_low => 2,
	c1_mode => "odd",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 25,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 54,
	clk0_phase_shift => "0",
	clk1_counter => "c1",
	clk1_divide_by => 25,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 54,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 19,
	m => 54,
	m_initial => 1,
	m_ph => 0,
	n => 5,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	pll_compensation_delay => 3789,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 231,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	areset => GND,
	fbin => \C|altpll_0|sd1|wire_pll7_fbout\,
	inclk => \C|altpll_0|sd1|pll7_INCLK_bus\,
	fbout => \C|altpll_0|sd1|wire_pll7_fbout\,
	clk => \C|altpll_0|sd1|pll7_CLK_bus\);

-- Location: CLKCTRL_G4
\C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\);

-- Location: LCCOMB_X59_Y45_N4
\C1|HPOS[0]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|HPOS[0]~11_combout\ = \C1|HPOS\(0) $ (VCC)
-- \C1|HPOS[0]~12\ = CARRY(\C1|HPOS\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(0),
	datad => VCC,
	combout => \C1|HPOS[0]~11_combout\,
	cout => \C1|HPOS[0]~12\);

-- Location: LCCOMB_X59_Y45_N16
\C1|HPOS[6]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|HPOS[6]~23_combout\ = (\C1|HPOS\(6) & (\C1|HPOS[5]~22\ $ (GND))) # (!\C1|HPOS\(6) & (!\C1|HPOS[5]~22\ & VCC))
-- \C1|HPOS[6]~24\ = CARRY((\C1|HPOS\(6) & !\C1|HPOS[5]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(6),
	datad => VCC,
	cin => \C1|HPOS[5]~22\,
	combout => \C1|HPOS[6]~23_combout\,
	cout => \C1|HPOS[6]~24\);

-- Location: FF_X59_Y45_N17
\C1|HPOS[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|HPOS[6]~23_combout\,
	sclr => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|HPOS\(6));

-- Location: LCCOMB_X59_Y45_N0
\C1|process_0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|process_0~8_combout\ = (!\C1|HPOS\(5) & !\C1|HPOS\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|HPOS\(5),
	datad => \C1|HPOS\(6),
	combout => \C1|process_0~8_combout\);

-- Location: LCCOMB_X59_Y45_N10
\C1|HPOS[3]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|HPOS[3]~17_combout\ = (\C1|HPOS\(3) & (!\C1|HPOS[2]~16\)) # (!\C1|HPOS\(3) & ((\C1|HPOS[2]~16\) # (GND)))
-- \C1|HPOS[3]~18\ = CARRY((!\C1|HPOS[2]~16\) # (!\C1|HPOS\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(3),
	datad => VCC,
	cin => \C1|HPOS[2]~16\,
	combout => \C1|HPOS[3]~17_combout\,
	cout => \C1|HPOS[3]~18\);

-- Location: FF_X59_Y45_N11
\C1|HPOS[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|HPOS[3]~17_combout\,
	sclr => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|HPOS\(3));

-- Location: LCCOMB_X59_Y45_N2
\C1|LessThan19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan19~0_combout\ = ((\C1|process_0~8_combout\ & ((!\C1|HPOS\(3)) # (!\C1|HPOS\(4))))) # (!\C1|HPOS\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(4),
	datab => \C1|process_0~8_combout\,
	datac => \C1|HPOS\(7),
	datad => \C1|HPOS\(3),
	combout => \C1|LessThan19~0_combout\);

-- Location: LCCOMB_X59_Y45_N22
\C1|HPOS[9]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|HPOS[9]~29_combout\ = (\C1|HPOS\(9) & (!\C1|HPOS[8]~28\)) # (!\C1|HPOS\(9) & ((\C1|HPOS[8]~28\) # (GND)))
-- \C1|HPOS[9]~30\ = CARRY((!\C1|HPOS[8]~28\) # (!\C1|HPOS\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(9),
	datad => VCC,
	cin => \C1|HPOS[8]~28\,
	combout => \C1|HPOS[9]~29_combout\,
	cout => \C1|HPOS[9]~30\);

-- Location: LCCOMB_X59_Y45_N24
\C1|HPOS[10]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|HPOS[10]~31_combout\ = \C1|HPOS\(10) $ (!\C1|HPOS[9]~30\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(10),
	cin => \C1|HPOS[9]~30\,
	combout => \C1|HPOS[10]~31_combout\);

-- Location: FF_X59_Y45_N25
\C1|HPOS[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|HPOS[10]~31_combout\,
	sclr => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|HPOS\(10));

-- Location: LCCOMB_X59_Y45_N30
\C1|LessThan12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan12~0_combout\ = (\C1|HPOS\(9) & (\C1|HPOS\(10) & ((\C1|HPOS\(8)) # (!\C1|LessThan19~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(8),
	datab => \C1|LessThan19~0_combout\,
	datac => \C1|HPOS\(9),
	datad => \C1|HPOS\(10),
	combout => \C1|LessThan12~0_combout\);

-- Location: FF_X59_Y45_N5
\C1|HPOS[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|HPOS[0]~11_combout\,
	sclr => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|HPOS\(0));

-- Location: LCCOMB_X59_Y45_N6
\C1|HPOS[1]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|HPOS[1]~13_combout\ = (\C1|HPOS\(1) & (!\C1|HPOS[0]~12\)) # (!\C1|HPOS\(1) & ((\C1|HPOS[0]~12\) # (GND)))
-- \C1|HPOS[1]~14\ = CARRY((!\C1|HPOS[0]~12\) # (!\C1|HPOS\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(1),
	datad => VCC,
	cin => \C1|HPOS[0]~12\,
	combout => \C1|HPOS[1]~13_combout\,
	cout => \C1|HPOS[1]~14\);

-- Location: FF_X59_Y45_N7
\C1|HPOS[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|HPOS[1]~13_combout\,
	sclr => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|HPOS\(1));

-- Location: LCCOMB_X59_Y45_N8
\C1|HPOS[2]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|HPOS[2]~15_combout\ = (\C1|HPOS\(2) & (\C1|HPOS[1]~14\ $ (GND))) # (!\C1|HPOS\(2) & (!\C1|HPOS[1]~14\ & VCC))
-- \C1|HPOS[2]~16\ = CARRY((\C1|HPOS\(2) & !\C1|HPOS[1]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(2),
	datad => VCC,
	cin => \C1|HPOS[1]~14\,
	combout => \C1|HPOS[2]~15_combout\,
	cout => \C1|HPOS[2]~16\);

-- Location: FF_X59_Y45_N9
\C1|HPOS[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|HPOS[2]~15_combout\,
	sclr => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|HPOS\(2));

-- Location: LCCOMB_X59_Y45_N12
\C1|HPOS[4]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|HPOS[4]~19_combout\ = (\C1|HPOS\(4) & (\C1|HPOS[3]~18\ $ (GND))) # (!\C1|HPOS\(4) & (!\C1|HPOS[3]~18\ & VCC))
-- \C1|HPOS[4]~20\ = CARRY((\C1|HPOS\(4) & !\C1|HPOS[3]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(4),
	datad => VCC,
	cin => \C1|HPOS[3]~18\,
	combout => \C1|HPOS[4]~19_combout\,
	cout => \C1|HPOS[4]~20\);

-- Location: LCCOMB_X59_Y45_N14
\C1|HPOS[5]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|HPOS[5]~21_combout\ = (\C1|HPOS\(5) & (!\C1|HPOS[4]~20\)) # (!\C1|HPOS\(5) & ((\C1|HPOS[4]~20\) # (GND)))
-- \C1|HPOS[5]~22\ = CARRY((!\C1|HPOS[4]~20\) # (!\C1|HPOS\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(5),
	datad => VCC,
	cin => \C1|HPOS[4]~20\,
	combout => \C1|HPOS[5]~21_combout\,
	cout => \C1|HPOS[5]~22\);

-- Location: FF_X59_Y45_N15
\C1|HPOS[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|HPOS[5]~21_combout\,
	sclr => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|HPOS\(5));

-- Location: LCCOMB_X59_Y45_N18
\C1|HPOS[7]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|HPOS[7]~25_combout\ = (\C1|HPOS\(7) & (!\C1|HPOS[6]~24\)) # (!\C1|HPOS\(7) & ((\C1|HPOS[6]~24\) # (GND)))
-- \C1|HPOS[7]~26\ = CARRY((!\C1|HPOS[6]~24\) # (!\C1|HPOS\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(7),
	datad => VCC,
	cin => \C1|HPOS[6]~24\,
	combout => \C1|HPOS[7]~25_combout\,
	cout => \C1|HPOS[7]~26\);

-- Location: FF_X59_Y45_N19
\C1|HPOS[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|HPOS[7]~25_combout\,
	sclr => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|HPOS\(7));

-- Location: LCCOMB_X59_Y45_N20
\C1|HPOS[8]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|HPOS[8]~27_combout\ = (\C1|HPOS\(8) & (\C1|HPOS[7]~26\ $ (GND))) # (!\C1|HPOS\(8) & (!\C1|HPOS[7]~26\ & VCC))
-- \C1|HPOS[8]~28\ = CARRY((\C1|HPOS\(8) & !\C1|HPOS[7]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(8),
	datad => VCC,
	cin => \C1|HPOS[7]~26\,
	combout => \C1|HPOS[8]~27_combout\,
	cout => \C1|HPOS[8]~28\);

-- Location: FF_X59_Y45_N21
\C1|HPOS[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|HPOS[8]~27_combout\,
	sclr => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|HPOS\(8));

-- Location: FF_X59_Y45_N23
\C1|HPOS[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|HPOS[9]~29_combout\,
	sclr => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|HPOS\(9));

-- Location: LCCOMB_X63_Y45_N2
\C1|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|process_0~0_combout\ = (\C1|HPOS\(9)) # ((\C1|HPOS\(8)) # (\C1|HPOS\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(9),
	datac => \C1|HPOS\(8),
	datad => \C1|HPOS\(10),
	combout => \C1|process_0~0_combout\);

-- Location: LCCOMB_X63_Y45_N4
\C1|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|process_0~1_combout\ = (!\C1|HPOS\(2) & (!\C1|HPOS\(3) & (!\C1|HPOS\(1) & !\C1|HPOS\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(2),
	datab => \C1|HPOS\(3),
	datac => \C1|HPOS\(1),
	datad => \C1|HPOS\(0),
	combout => \C1|process_0~1_combout\);

-- Location: FF_X59_Y45_N13
\C1|HPOS[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|HPOS[4]~19_combout\,
	sclr => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|HPOS\(4));

-- Location: LCCOMB_X63_Y45_N6
\C1|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|process_0~2_combout\ = (\C1|HPOS\(5) & ((\C1|HPOS\(7)) # ((!\C1|process_0~1_combout\ & \C1|HPOS\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(7),
	datab => \C1|HPOS\(5),
	datac => \C1|process_0~1_combout\,
	datad => \C1|HPOS\(4),
	combout => \C1|process_0~2_combout\);

-- Location: LCCOMB_X63_Y45_N0
\C1|process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|process_0~3_combout\ = (\C1|process_0~0_combout\) # (\C1|HPOS\(7) $ (((!\C1|HPOS\(6) & !\C1|process_0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(7),
	datab => \C1|process_0~0_combout\,
	datac => \C1|HPOS\(6),
	datad => \C1|process_0~2_combout\,
	combout => \C1|process_0~3_combout\);

-- Location: FF_X63_Y45_N1
\C1|HSYNC\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|process_0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|HSYNC~q\);

-- Location: LCCOMB_X60_Y44_N4
\C1|VPOS[0]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|VPOS[0]~11_combout\ = \C1|VPOS\(0) $ (VCC)
-- \C1|VPOS[0]~12\ = CARRY(\C1|VPOS\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C1|VPOS\(0),
	datad => VCC,
	combout => \C1|VPOS[0]~11_combout\,
	cout => \C1|VPOS[0]~12\);

-- Location: LCCOMB_X60_Y44_N18
\C1|VPOS[7]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|VPOS[7]~25_combout\ = (\C1|VPOS\(7) & (!\C1|VPOS[6]~24\)) # (!\C1|VPOS\(7) & ((\C1|VPOS[6]~24\) # (GND)))
-- \C1|VPOS[7]~26\ = CARRY((!\C1|VPOS[6]~24\) # (!\C1|VPOS\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|VPOS\(7),
	datad => VCC,
	cin => \C1|VPOS[6]~24\,
	combout => \C1|VPOS[7]~25_combout\,
	cout => \C1|VPOS[7]~26\);

-- Location: LCCOMB_X60_Y44_N20
\C1|VPOS[8]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|VPOS[8]~27_combout\ = (\C1|VPOS\(8) & (\C1|VPOS[7]~26\ $ (GND))) # (!\C1|VPOS\(8) & (!\C1|VPOS[7]~26\ & VCC))
-- \C1|VPOS[8]~28\ = CARRY((\C1|VPOS\(8) & !\C1|VPOS[7]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(8),
	datad => VCC,
	cin => \C1|VPOS[7]~26\,
	combout => \C1|VPOS[8]~27_combout\,
	cout => \C1|VPOS[8]~28\);

-- Location: LCCOMB_X60_Y44_N22
\C1|VPOS[9]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|VPOS[9]~29_combout\ = (\C1|VPOS\(9) & (!\C1|VPOS[8]~28\)) # (!\C1|VPOS\(9) & ((\C1|VPOS[8]~28\) # (GND)))
-- \C1|VPOS[9]~30\ = CARRY((!\C1|VPOS[8]~28\) # (!\C1|VPOS\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|VPOS\(9),
	datad => VCC,
	cin => \C1|VPOS[8]~28\,
	combout => \C1|VPOS[9]~29_combout\,
	cout => \C1|VPOS[9]~30\);

-- Location: FF_X60_Y44_N23
\C1|VPOS[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|VPOS[9]~29_combout\,
	sclr => \C1|LessThan13~0_combout\,
	ena => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|VPOS\(9));

-- Location: LCCOMB_X60_Y44_N24
\C1|VPOS[10]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|VPOS[10]~31_combout\ = \C1|VPOS\(10) $ (!\C1|VPOS[9]~30\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(10),
	cin => \C1|VPOS[9]~30\,
	combout => \C1|VPOS[10]~31_combout\);

-- Location: FF_X60_Y44_N25
\C1|VPOS[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|VPOS[10]~31_combout\,
	sclr => \C1|LessThan13~0_combout\,
	ena => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|VPOS\(10));

-- Location: LCCOMB_X60_Y44_N30
\C1|LessThan13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan13~0_combout\ = (\C1|VPOS\(10) & (((!\C1|LessThan20~0_combout\ & \C1|VPOS\(5))) # (!\C1|process_0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|LessThan20~0_combout\,
	datab => \C1|VPOS\(10),
	datac => \C1|VPOS\(5),
	datad => \C1|process_0~4_combout\,
	combout => \C1|LessThan13~0_combout\);

-- Location: FF_X60_Y44_N5
\C1|VPOS[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|VPOS[0]~11_combout\,
	sclr => \C1|LessThan13~0_combout\,
	ena => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|VPOS\(0));

-- Location: LCCOMB_X60_Y44_N6
\C1|VPOS[1]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|VPOS[1]~13_combout\ = (\C1|VPOS\(1) & (!\C1|VPOS[0]~12\)) # (!\C1|VPOS\(1) & ((\C1|VPOS[0]~12\) # (GND)))
-- \C1|VPOS[1]~14\ = CARRY((!\C1|VPOS[0]~12\) # (!\C1|VPOS\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(1),
	datad => VCC,
	cin => \C1|VPOS[0]~12\,
	combout => \C1|VPOS[1]~13_combout\,
	cout => \C1|VPOS[1]~14\);

-- Location: LCCOMB_X60_Y44_N8
\C1|VPOS[2]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|VPOS[2]~15_combout\ = (\C1|VPOS\(2) & (\C1|VPOS[1]~14\ $ (GND))) # (!\C1|VPOS\(2) & (!\C1|VPOS[1]~14\ & VCC))
-- \C1|VPOS[2]~16\ = CARRY((\C1|VPOS\(2) & !\C1|VPOS[1]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(2),
	datad => VCC,
	cin => \C1|VPOS[1]~14\,
	combout => \C1|VPOS[2]~15_combout\,
	cout => \C1|VPOS[2]~16\);

-- Location: LCCOMB_X60_Y44_N12
\C1|VPOS[4]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|VPOS[4]~19_combout\ = (\C1|VPOS\(4) & (\C1|VPOS[3]~18\ $ (GND))) # (!\C1|VPOS\(4) & (!\C1|VPOS[3]~18\ & VCC))
-- \C1|VPOS[4]~20\ = CARRY((\C1|VPOS\(4) & !\C1|VPOS[3]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(4),
	datad => VCC,
	cin => \C1|VPOS[3]~18\,
	combout => \C1|VPOS[4]~19_combout\,
	cout => \C1|VPOS[4]~20\);

-- Location: LCCOMB_X60_Y44_N14
\C1|VPOS[5]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|VPOS[5]~21_combout\ = (\C1|VPOS\(5) & (!\C1|VPOS[4]~20\)) # (!\C1|VPOS\(5) & ((\C1|VPOS[4]~20\) # (GND)))
-- \C1|VPOS[5]~22\ = CARRY((!\C1|VPOS[4]~20\) # (!\C1|VPOS\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|VPOS\(5),
	datad => VCC,
	cin => \C1|VPOS[4]~20\,
	combout => \C1|VPOS[5]~21_combout\,
	cout => \C1|VPOS[5]~22\);

-- Location: FF_X60_Y44_N15
\C1|VPOS[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|VPOS[5]~21_combout\,
	sclr => \C1|LessThan13~0_combout\,
	ena => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|VPOS\(5));

-- Location: LCCOMB_X60_Y44_N16
\C1|VPOS[6]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|VPOS[6]~23_combout\ = (\C1|VPOS\(6) & (\C1|VPOS[5]~22\ $ (GND))) # (!\C1|VPOS\(6) & (!\C1|VPOS[5]~22\ & VCC))
-- \C1|VPOS[6]~24\ = CARRY((\C1|VPOS\(6) & !\C1|VPOS[5]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|VPOS\(6),
	datad => VCC,
	cin => \C1|VPOS[5]~22\,
	combout => \C1|VPOS[6]~23_combout\,
	cout => \C1|VPOS[6]~24\);

-- Location: FF_X60_Y44_N17
\C1|VPOS[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|VPOS[6]~23_combout\,
	sclr => \C1|LessThan13~0_combout\,
	ena => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|VPOS\(6));

-- Location: FF_X60_Y44_N19
\C1|VPOS[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|VPOS[7]~25_combout\,
	sclr => \C1|LessThan13~0_combout\,
	ena => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|VPOS\(7));

-- Location: LCCOMB_X60_Y44_N0
\C1|process_0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|process_0~4_combout\ = (!\C1|VPOS\(8) & (!\C1|VPOS\(7) & (!\C1|VPOS\(9) & !\C1|VPOS\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(8),
	datab => \C1|VPOS\(7),
	datac => \C1|VPOS\(9),
	datad => \C1|VPOS\(6),
	combout => \C1|process_0~4_combout\);

-- Location: FF_X60_Y44_N7
\C1|VPOS[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|VPOS[1]~13_combout\,
	sclr => \C1|LessThan13~0_combout\,
	ena => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|VPOS\(1));

-- Location: LCCOMB_X59_Y43_N2
\C1|LessThan16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan16~0_combout\ = (!\C1|VPOS\(0) & !\C1|VPOS\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|VPOS\(0),
	datad => \C1|VPOS\(1),
	combout => \C1|LessThan16~0_combout\);

-- Location: LCCOMB_X59_Y43_N0
\C1|process_0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|process_0~5_combout\ = (((\C1|LessThan16~0_combout\) # (\C1|VPOS\(10))) # (!\C1|process_0~4_combout\)) # (!\C1|LessThan16~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|LessThan16~1_combout\,
	datab => \C1|process_0~4_combout\,
	datac => \C1|LessThan16~0_combout\,
	datad => \C1|VPOS\(10),
	combout => \C1|process_0~5_combout\);

-- Location: FF_X59_Y43_N1
\C1|vSYNC\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|process_0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|vSYNC~q\);

-- Location: CLKCTRL_G3
\C|altpll_0|sd1|wire_pll7_clk[0]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \C|altpll_0|sd1|wire_pll7_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \C|altpll_0|sd1|wire_pll7_clk[0]~clkctrl_outclk\);

-- Location: IOIBUF_X115_Y53_N15
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: LCCOMB_X60_Y45_N4
\C1|Add16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add16~1_combout\ = \C1|SQ_X3\(0) $ (VCC)
-- \C1|Add16~2\ = CARRY(\C1|SQ_X3\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X3\(0),
	datad => VCC,
	combout => \C1|Add16~1_combout\,
	cout => \C1|Add16~2\);

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: LCCOMB_X66_Y44_N2
\C1|SQ_X3[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X3[10]~0_combout\ = (\C1|LessThan12~0_combout\ & (\C1|LessThan13~0_combout\ & ((!\KEY[0]~input_o\) # (!\KEY[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|LessThan12~0_combout\,
	datac => \KEY[0]~input_o\,
	datad => \C1|LessThan13~0_combout\,
	combout => \C1|SQ_X3[10]~0_combout\);

-- Location: LCCOMB_X66_Y44_N30
\C1|SQ_X3[10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X3[10]~1_combout\ = (\SW[2]~input_o\ & \C1|SQ_X3[10]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[2]~input_o\,
	datad => \C1|SQ_X3[10]~0_combout\,
	combout => \C1|SQ_X3[10]~1_combout\);

-- Location: FF_X60_Y45_N5
\C1|SQ_X3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add16~1_combout\,
	ena => \C1|SQ_X3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X3\(0));

-- Location: LCCOMB_X60_Y45_N6
\C1|Add16~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add16~3_combout\ = (\C1|SQ_X3\(1) & ((\KEY[1]~input_o\ & (!\C1|Add16~2\)) # (!\KEY[1]~input_o\ & (\C1|Add16~2\ & VCC)))) # (!\C1|SQ_X3\(1) & ((\KEY[1]~input_o\ & ((\C1|Add16~2\) # (GND))) # (!\KEY[1]~input_o\ & (!\C1|Add16~2\))))
-- \C1|Add16~4\ = CARRY((\C1|SQ_X3\(1) & (\KEY[1]~input_o\ & !\C1|Add16~2\)) # (!\C1|SQ_X3\(1) & ((\KEY[1]~input_o\) # (!\C1|Add16~2\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X3\(1),
	datab => \KEY[1]~input_o\,
	datad => VCC,
	cin => \C1|Add16~2\,
	combout => \C1|Add16~3_combout\,
	cout => \C1|Add16~4\);

-- Location: LCCOMB_X60_Y45_N8
\C1|Add16~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add16~5_combout\ = ((\KEY[1]~input_o\ $ (\C1|SQ_X3\(2) $ (\C1|Add16~4\)))) # (GND)
-- \C1|Add16~6\ = CARRY((\KEY[1]~input_o\ & ((!\C1|Add16~4\) # (!\C1|SQ_X3\(2)))) # (!\KEY[1]~input_o\ & (!\C1|SQ_X3\(2) & !\C1|Add16~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X3\(2),
	datad => VCC,
	cin => \C1|Add16~4\,
	combout => \C1|Add16~5_combout\,
	cout => \C1|Add16~6\);

-- Location: LCCOMB_X61_Y45_N28
\C1|SQ_X3[2]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X3[2]~7_combout\ = !\C1|Add16~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add16~5_combout\,
	combout => \C1|SQ_X3[2]~7_combout\);

-- Location: FF_X61_Y45_N29
\C1|SQ_X3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X3[2]~7_combout\,
	ena => \C1|SQ_X3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X3\(2));

-- Location: LCCOMB_X60_Y45_N10
\C1|Add16~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add16~7_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X3\(3) & ((\C1|Add16~6\) # (GND))) # (!\C1|SQ_X3\(3) & (!\C1|Add16~6\)))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X3\(3) & (!\C1|Add16~6\)) # (!\C1|SQ_X3\(3) & (\C1|Add16~6\ & VCC))))
-- \C1|Add16~8\ = CARRY((\KEY[1]~input_o\ & ((\C1|SQ_X3\(3)) # (!\C1|Add16~6\))) # (!\KEY[1]~input_o\ & (\C1|SQ_X3\(3) & !\C1|Add16~6\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X3\(3),
	datad => VCC,
	cin => \C1|Add16~6\,
	combout => \C1|Add16~7_combout\,
	cout => \C1|Add16~8\);

-- Location: LCCOMB_X61_Y45_N2
\C1|SQ_X3[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X3[3]~6_combout\ = !\C1|Add16~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add16~7_combout\,
	combout => \C1|SQ_X3[3]~6_combout\);

-- Location: FF_X61_Y45_N3
\C1|SQ_X3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X3[3]~6_combout\,
	ena => \C1|SQ_X3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X3\(3));

-- Location: LCCOMB_X60_Y45_N12
\C1|Add16~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add16~9_combout\ = ((\KEY[1]~input_o\ $ (\C1|SQ_X3\(4) $ (!\C1|Add16~8\)))) # (GND)
-- \C1|Add16~10\ = CARRY((\KEY[1]~input_o\ & (!\C1|SQ_X3\(4) & !\C1|Add16~8\)) # (!\KEY[1]~input_o\ & ((!\C1|Add16~8\) # (!\C1|SQ_X3\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X3\(4),
	datad => VCC,
	cin => \C1|Add16~8\,
	combout => \C1|Add16~9_combout\,
	cout => \C1|Add16~10\);

-- Location: LCCOMB_X61_Y45_N24
\C1|SQ_X3[4]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X3[4]~5_combout\ = !\C1|Add16~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add16~9_combout\,
	combout => \C1|SQ_X3[4]~5_combout\);

-- Location: FF_X61_Y45_N25
\C1|SQ_X3[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X3[4]~5_combout\,
	ena => \C1|SQ_X3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X3\(4));

-- Location: LCCOMB_X60_Y45_N14
\C1|Add16~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add16~11_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X3\(5) & ((\C1|Add16~10\) # (GND))) # (!\C1|SQ_X3\(5) & (!\C1|Add16~10\)))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X3\(5) & (!\C1|Add16~10\)) # (!\C1|SQ_X3\(5) & (\C1|Add16~10\ & VCC))))
-- \C1|Add16~12\ = CARRY((\KEY[1]~input_o\ & ((\C1|SQ_X3\(5)) # (!\C1|Add16~10\))) # (!\KEY[1]~input_o\ & (\C1|SQ_X3\(5) & !\C1|Add16~10\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X3\(5),
	datad => VCC,
	cin => \C1|Add16~10\,
	combout => \C1|Add16~11_combout\,
	cout => \C1|Add16~12\);

-- Location: LCCOMB_X61_Y45_N30
\C1|SQ_X3[5]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X3[5]~4_combout\ = !\C1|Add16~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add16~11_combout\,
	combout => \C1|SQ_X3[5]~4_combout\);

-- Location: FF_X61_Y45_N31
\C1|SQ_X3[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X3[5]~4_combout\,
	ena => \C1|SQ_X3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X3\(5));

-- Location: LCCOMB_X60_Y45_N16
\C1|Add16~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add16~13_combout\ = ((\KEY[1]~input_o\ $ (\C1|SQ_X3\(6) $ (\C1|Add16~12\)))) # (GND)
-- \C1|Add16~14\ = CARRY((\KEY[1]~input_o\ & (\C1|SQ_X3\(6) & !\C1|Add16~12\)) # (!\KEY[1]~input_o\ & ((\C1|SQ_X3\(6)) # (!\C1|Add16~12\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X3\(6),
	datad => VCC,
	cin => \C1|Add16~12\,
	combout => \C1|Add16~13_combout\,
	cout => \C1|Add16~14\);

-- Location: FF_X60_Y45_N17
\C1|SQ_X3[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add16~13_combout\,
	ena => \C1|SQ_X3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X3\(6));

-- Location: LCCOMB_X60_Y45_N18
\C1|Add16~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add16~15_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X3\(7) & ((\C1|Add16~14\) # (GND))) # (!\C1|SQ_X3\(7) & (!\C1|Add16~14\)))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X3\(7) & (!\C1|Add16~14\)) # (!\C1|SQ_X3\(7) & (\C1|Add16~14\ & VCC))))
-- \C1|Add16~16\ = CARRY((\KEY[1]~input_o\ & ((\C1|SQ_X3\(7)) # (!\C1|Add16~14\))) # (!\KEY[1]~input_o\ & (\C1|SQ_X3\(7) & !\C1|Add16~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X3\(7),
	datad => VCC,
	cin => \C1|Add16~14\,
	combout => \C1|Add16~15_combout\,
	cout => \C1|Add16~16\);

-- Location: LCCOMB_X61_Y45_N26
\C1|SQ_X3[7]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X3[7]~3_combout\ = !\C1|Add16~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add16~15_combout\,
	combout => \C1|SQ_X3[7]~3_combout\);

-- Location: FF_X61_Y45_N27
\C1|SQ_X3[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X3[7]~3_combout\,
	ena => \C1|SQ_X3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X3\(7));

-- Location: LCCOMB_X60_Y45_N20
\C1|Add16~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add16~17_combout\ = ((\KEY[1]~input_o\ $ (\C1|SQ_X3\(8) $ (\C1|Add16~16\)))) # (GND)
-- \C1|Add16~18\ = CARRY((\KEY[1]~input_o\ & (\C1|SQ_X3\(8) & !\C1|Add16~16\)) # (!\KEY[1]~input_o\ & ((\C1|SQ_X3\(8)) # (!\C1|Add16~16\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X3\(8),
	datad => VCC,
	cin => \C1|Add16~16\,
	combout => \C1|Add16~17_combout\,
	cout => \C1|Add16~18\);

-- Location: FF_X60_Y45_N21
\C1|SQ_X3[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add16~17_combout\,
	ena => \C1|SQ_X3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X3\(8));

-- Location: LCCOMB_X60_Y45_N22
\C1|Add16~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add16~19_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X3\(9) & ((\C1|Add16~18\) # (GND))) # (!\C1|SQ_X3\(9) & (!\C1|Add16~18\)))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X3\(9) & (!\C1|Add16~18\)) # (!\C1|SQ_X3\(9) & (\C1|Add16~18\ & VCC))))
-- \C1|Add16~20\ = CARRY((\KEY[1]~input_o\ & ((\C1|SQ_X3\(9)) # (!\C1|Add16~18\))) # (!\KEY[1]~input_o\ & (\C1|SQ_X3\(9) & !\C1|Add16~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X3\(9),
	datad => VCC,
	cin => \C1|Add16~18\,
	combout => \C1|Add16~19_combout\,
	cout => \C1|Add16~20\);

-- Location: LCCOMB_X61_Y45_N0
\C1|SQ_X3[9]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X3[9]~2_combout\ = !\C1|Add16~19_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add16~19_combout\,
	combout => \C1|SQ_X3[9]~2_combout\);

-- Location: FF_X61_Y45_N1
\C1|SQ_X3[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X3[9]~2_combout\,
	ena => \C1|SQ_X3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X3\(9));

-- Location: LCCOMB_X60_Y45_N24
\C1|Add16~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add16~21_combout\ = \C1|SQ_X3\(10) $ (\C1|Add16~20\ $ (\KEY[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X3\(10),
	datad => \KEY[1]~input_o\,
	cin => \C1|Add16~20\,
	combout => \C1|Add16~21_combout\);

-- Location: FF_X60_Y45_N25
\C1|SQ_X3[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add16~21_combout\,
	ena => \C1|SQ_X3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X3\(10));

-- Location: FF_X60_Y45_N7
\C1|SQ_X3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add16~3_combout\,
	ena => \C1|SQ_X3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X3\(1));

-- Location: LCCOMB_X63_Y45_N8
\C1|LessThan8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan8~1_cout\ = CARRY((\C1|HPOS\(0) & !\C1|SQ_X3\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(0),
	datab => \C1|SQ_X3\(0),
	datad => VCC,
	cout => \C1|LessThan8~1_cout\);

-- Location: LCCOMB_X63_Y45_N10
\C1|LessThan8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan8~3_cout\ = CARRY((\C1|HPOS\(1) & (\C1|SQ_X3\(1) & !\C1|LessThan8~1_cout\)) # (!\C1|HPOS\(1) & ((\C1|SQ_X3\(1)) # (!\C1|LessThan8~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(1),
	datab => \C1|SQ_X3\(1),
	datad => VCC,
	cin => \C1|LessThan8~1_cout\,
	cout => \C1|LessThan8~3_cout\);

-- Location: LCCOMB_X63_Y45_N12
\C1|LessThan8~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan8~5_cout\ = CARRY((\C1|HPOS\(2) & ((\C1|SQ_X3\(2)) # (!\C1|LessThan8~3_cout\))) # (!\C1|HPOS\(2) & (\C1|SQ_X3\(2) & !\C1|LessThan8~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(2),
	datab => \C1|SQ_X3\(2),
	datad => VCC,
	cin => \C1|LessThan8~3_cout\,
	cout => \C1|LessThan8~5_cout\);

-- Location: LCCOMB_X63_Y45_N14
\C1|LessThan8~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan8~7_cout\ = CARRY((\C1|HPOS\(3) & (!\C1|SQ_X3\(3) & !\C1|LessThan8~5_cout\)) # (!\C1|HPOS\(3) & ((!\C1|LessThan8~5_cout\) # (!\C1|SQ_X3\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(3),
	datab => \C1|SQ_X3\(3),
	datad => VCC,
	cin => \C1|LessThan8~5_cout\,
	cout => \C1|LessThan8~7_cout\);

-- Location: LCCOMB_X63_Y45_N16
\C1|LessThan8~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan8~9_cout\ = CARRY((\C1|SQ_X3\(4) & ((\C1|HPOS\(4)) # (!\C1|LessThan8~7_cout\))) # (!\C1|SQ_X3\(4) & (\C1|HPOS\(4) & !\C1|LessThan8~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X3\(4),
	datab => \C1|HPOS\(4),
	datad => VCC,
	cin => \C1|LessThan8~7_cout\,
	cout => \C1|LessThan8~9_cout\);

-- Location: LCCOMB_X63_Y45_N18
\C1|LessThan8~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan8~11_cout\ = CARRY((\C1|SQ_X3\(5) & (!\C1|HPOS\(5) & !\C1|LessThan8~9_cout\)) # (!\C1|SQ_X3\(5) & ((!\C1|LessThan8~9_cout\) # (!\C1|HPOS\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X3\(5),
	datab => \C1|HPOS\(5),
	datad => VCC,
	cin => \C1|LessThan8~9_cout\,
	cout => \C1|LessThan8~11_cout\);

-- Location: LCCOMB_X63_Y45_N20
\C1|LessThan8~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan8~13_cout\ = CARRY((\C1|HPOS\(6) & ((!\C1|LessThan8~11_cout\) # (!\C1|SQ_X3\(6)))) # (!\C1|HPOS\(6) & (!\C1|SQ_X3\(6) & !\C1|LessThan8~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(6),
	datab => \C1|SQ_X3\(6),
	datad => VCC,
	cin => \C1|LessThan8~11_cout\,
	cout => \C1|LessThan8~13_cout\);

-- Location: LCCOMB_X63_Y45_N22
\C1|LessThan8~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan8~15_cout\ = CARRY((\C1|HPOS\(7) & (!\C1|SQ_X3\(7) & !\C1|LessThan8~13_cout\)) # (!\C1|HPOS\(7) & ((!\C1|LessThan8~13_cout\) # (!\C1|SQ_X3\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(7),
	datab => \C1|SQ_X3\(7),
	datad => VCC,
	cin => \C1|LessThan8~13_cout\,
	cout => \C1|LessThan8~15_cout\);

-- Location: LCCOMB_X63_Y45_N24
\C1|LessThan8~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan8~17_cout\ = CARRY((\C1|SQ_X3\(8) & (\C1|HPOS\(8) & !\C1|LessThan8~15_cout\)) # (!\C1|SQ_X3\(8) & ((\C1|HPOS\(8)) # (!\C1|LessThan8~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X3\(8),
	datab => \C1|HPOS\(8),
	datad => VCC,
	cin => \C1|LessThan8~15_cout\,
	cout => \C1|LessThan8~17_cout\);

-- Location: LCCOMB_X63_Y45_N26
\C1|LessThan8~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan8~19_cout\ = CARRY((\C1|SQ_X3\(9) & (!\C1|HPOS\(9) & !\C1|LessThan8~17_cout\)) # (!\C1|SQ_X3\(9) & ((!\C1|LessThan8~17_cout\) # (!\C1|HPOS\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X3\(9),
	datab => \C1|HPOS\(9),
	datad => VCC,
	cin => \C1|LessThan8~17_cout\,
	cout => \C1|LessThan8~19_cout\);

-- Location: LCCOMB_X63_Y45_N28
\C1|LessThan8~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan8~20_combout\ = (\C1|HPOS\(10) & ((!\C1|SQ_X3\(10)) # (!\C1|LessThan8~19_cout\))) # (!\C1|HPOS\(10) & (!\C1|LessThan8~19_cout\ & !\C1|SQ_X3\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(10),
	datad => \C1|SQ_X3\(10),
	cin => \C1|LessThan8~19_cout\,
	combout => \C1|LessThan8~20_combout\);

-- Location: FF_X60_Y44_N9
\C1|VPOS[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|VPOS[2]~15_combout\,
	sclr => \C1|LessThan13~0_combout\,
	ena => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|VPOS\(2));

-- Location: FF_X60_Y44_N13
\C1|VPOS[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|VPOS[4]~19_combout\,
	sclr => \C1|LessThan13~0_combout\,
	ena => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|VPOS\(4));

-- Location: LCCOMB_X59_Y43_N4
\C1|LessThan16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan16~1_combout\ = (!\C1|VPOS\(3) & (!\C1|VPOS\(2) & (!\C1|VPOS\(4) & !\C1|VPOS\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(3),
	datab => \C1|VPOS\(2),
	datac => \C1|VPOS\(4),
	datad => \C1|VPOS\(5),
	combout => \C1|LessThan16~1_combout\);

-- Location: LCCOMB_X60_Y44_N2
\C1|process_0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|process_0~6_combout\ = ((\C1|VPOS\(10)) # ((!\C1|LessThan20~0_combout\ & \C1|VPOS\(5)))) # (!\C1|process_0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|LessThan20~0_combout\,
	datab => \C1|process_0~4_combout\,
	datac => \C1|VPOS\(5),
	datad => \C1|VPOS\(10),
	combout => \C1|process_0~6_combout\);

-- Location: LCCOMB_X60_Y44_N28
\C1|process_0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|process_0~7_combout\ = (\C1|process_0~6_combout\) # ((!\C1|VPOS\(1) & (\C1|LessThan16~1_combout\ & !\C1|VPOS\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(1),
	datab => \C1|LessThan16~1_combout\,
	datac => \C1|VPOS\(0),
	datad => \C1|process_0~6_combout\,
	combout => \C1|process_0~7_combout\);

-- Location: LCCOMB_X59_Y45_N26
\C1|process_0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|process_0~9_combout\ = (\C1|HPOS\(9)) # ((\C1|HPOS\(10)) # ((\C1|HPOS\(8) & !\C1|LessThan19~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(8),
	datab => \C1|LessThan19~0_combout\,
	datac => \C1|HPOS\(9),
	datad => \C1|HPOS\(10),
	combout => \C1|process_0~9_combout\);

-- Location: LCCOMB_X61_Y44_N8
\C1|B~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|B~0_combout\ = (\C1|process_0~7_combout\ & ((\C1|process_0~9_combout\) # ((\C1|process_0~10_combout\ & \C1|process_0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|process_0~10_combout\,
	datab => \C1|process_0~7_combout\,
	datac => \C1|process_0~9_combout\,
	datad => \C1|process_0~1_combout\,
	combout => \C1|B~0_combout\);

-- Location: LCCOMB_X61_Y45_N4
\C1|Add4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add4~0_combout\ = (\C1|SQ_X3\(2) & (!\C1|SQ_X3\(3) & VCC)) # (!\C1|SQ_X3\(2) & (\C1|SQ_X3\(3) $ (GND)))
-- \C1|Add4~1\ = CARRY((!\C1|SQ_X3\(2) & !\C1|SQ_X3\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X3\(2),
	datab => \C1|SQ_X3\(3),
	datad => VCC,
	combout => \C1|Add4~0_combout\,
	cout => \C1|Add4~1\);

-- Location: LCCOMB_X61_Y45_N6
\C1|Add4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add4~2_combout\ = (\C1|SQ_X3\(4) & ((\C1|Add4~1\) # (GND))) # (!\C1|SQ_X3\(4) & (!\C1|Add4~1\))
-- \C1|Add4~3\ = CARRY((\C1|SQ_X3\(4)) # (!\C1|Add4~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X3\(4),
	datad => VCC,
	cin => \C1|Add4~1\,
	combout => \C1|Add4~2_combout\,
	cout => \C1|Add4~3\);

-- Location: LCCOMB_X61_Y45_N18
\C1|Add4~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add4~14_combout\ = (\C1|SQ_X3\(10) & (!\C1|Add4~13\)) # (!\C1|SQ_X3\(10) & ((\C1|Add4~13\) # (GND)))
-- \C1|Add4~15\ = CARRY((!\C1|Add4~13\) # (!\C1|SQ_X3\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X3\(10),
	datad => VCC,
	cin => \C1|Add4~13\,
	combout => \C1|Add4~14_combout\,
	cout => \C1|Add4~15\);

-- Location: LCCOMB_X61_Y45_N20
\C1|Add4~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add4~16_combout\ = !\C1|Add4~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \C1|Add4~15\,
	combout => \C1|Add4~16_combout\);

-- Location: LCCOMB_X60_Y42_N8
\C1|Add18~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add18~1_combout\ = \C1|SQ_Y3\(0) $ (VCC)
-- \C1|Add18~2\ = CARRY(\C1|SQ_Y3\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y3\(0),
	datad => VCC,
	combout => \C1|Add18~1_combout\,
	cout => \C1|Add18~2\);

-- Location: IOIBUF_X115_Y42_N15
\KEY[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: LCCOMB_X66_Y44_N0
\C1|SQ_Y3[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y3[10]~0_combout\ = (\C1|LessThan12~0_combout\ & (\C1|LessThan13~0_combout\ & ((!\KEY[2]~input_o\) # (!\KEY[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|LessThan12~0_combout\,
	datac => \KEY[2]~input_o\,
	datad => \C1|LessThan13~0_combout\,
	combout => \C1|SQ_Y3[10]~0_combout\);

-- Location: LCCOMB_X66_Y44_N4
\C1|SQ_Y3[10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y3[10]~1_combout\ = (\SW[2]~input_o\ & \C1|SQ_Y3[10]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[2]~input_o\,
	datad => \C1|SQ_Y3[10]~0_combout\,
	combout => \C1|SQ_Y3[10]~1_combout\);

-- Location: FF_X60_Y42_N9
\C1|SQ_Y3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add18~1_combout\,
	ena => \C1|SQ_Y3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y3\(0));

-- Location: LCCOMB_X60_Y42_N10
\C1|Add18~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add18~3_combout\ = (\KEY[3]~input_o\ & ((\C1|SQ_Y3\(1) & (!\C1|Add18~2\)) # (!\C1|SQ_Y3\(1) & ((\C1|Add18~2\) # (GND))))) # (!\KEY[3]~input_o\ & ((\C1|SQ_Y3\(1) & (\C1|Add18~2\ & VCC)) # (!\C1|SQ_Y3\(1) & (!\C1|Add18~2\))))
-- \C1|Add18~4\ = CARRY((\KEY[3]~input_o\ & ((!\C1|Add18~2\) # (!\C1|SQ_Y3\(1)))) # (!\KEY[3]~input_o\ & (!\C1|SQ_Y3\(1) & !\C1|Add18~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y3\(1),
	datad => VCC,
	cin => \C1|Add18~2\,
	combout => \C1|Add18~3_combout\,
	cout => \C1|Add18~4\);

-- Location: FF_X60_Y42_N11
\C1|SQ_Y3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add18~3_combout\,
	ena => \C1|SQ_Y3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y3\(1));

-- Location: LCCOMB_X60_Y42_N12
\C1|Add18~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add18~5_combout\ = ((\KEY[3]~input_o\ $ (\C1|SQ_Y3\(2) $ (\C1|Add18~4\)))) # (GND)
-- \C1|Add18~6\ = CARRY((\KEY[3]~input_o\ & ((!\C1|Add18~4\) # (!\C1|SQ_Y3\(2)))) # (!\KEY[3]~input_o\ & (!\C1|SQ_Y3\(2) & !\C1|Add18~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y3\(2),
	datad => VCC,
	cin => \C1|Add18~4\,
	combout => \C1|Add18~5_combout\,
	cout => \C1|Add18~6\);

-- Location: LCCOMB_X59_Y42_N30
\C1|SQ_Y3[2]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y3[2]~7_combout\ = !\C1|Add18~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|Add18~5_combout\,
	combout => \C1|SQ_Y3[2]~7_combout\);

-- Location: FF_X59_Y42_N31
\C1|SQ_Y3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y3[2]~7_combout\,
	ena => \C1|SQ_Y3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y3\(2));

-- Location: LCCOMB_X60_Y42_N14
\C1|Add18~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add18~7_combout\ = (\KEY[3]~input_o\ & ((\C1|SQ_Y3\(3) & ((\C1|Add18~6\) # (GND))) # (!\C1|SQ_Y3\(3) & (!\C1|Add18~6\)))) # (!\KEY[3]~input_o\ & ((\C1|SQ_Y3\(3) & (!\C1|Add18~6\)) # (!\C1|SQ_Y3\(3) & (\C1|Add18~6\ & VCC))))
-- \C1|Add18~8\ = CARRY((\KEY[3]~input_o\ & ((\C1|SQ_Y3\(3)) # (!\C1|Add18~6\))) # (!\KEY[3]~input_o\ & (\C1|SQ_Y3\(3) & !\C1|Add18~6\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y3\(3),
	datad => VCC,
	cin => \C1|Add18~6\,
	combout => \C1|Add18~7_combout\,
	cout => \C1|Add18~8\);

-- Location: LCCOMB_X59_Y42_N4
\C1|SQ_Y3[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y3[3]~6_combout\ = !\C1|Add18~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|Add18~7_combout\,
	combout => \C1|SQ_Y3[3]~6_combout\);

-- Location: FF_X59_Y42_N5
\C1|SQ_Y3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y3[3]~6_combout\,
	ena => \C1|SQ_Y3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y3\(3));

-- Location: LCCOMB_X60_Y42_N16
\C1|Add18~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add18~9_combout\ = ((\KEY[3]~input_o\ $ (\C1|SQ_Y3\(4) $ (!\C1|Add18~8\)))) # (GND)
-- \C1|Add18~10\ = CARRY((\KEY[3]~input_o\ & (!\C1|SQ_Y3\(4) & !\C1|Add18~8\)) # (!\KEY[3]~input_o\ & ((!\C1|Add18~8\) # (!\C1|SQ_Y3\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y3\(4),
	datad => VCC,
	cin => \C1|Add18~8\,
	combout => \C1|Add18~9_combout\,
	cout => \C1|Add18~10\);

-- Location: LCCOMB_X59_Y42_N2
\C1|SQ_Y3[4]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y3[4]~5_combout\ = !\C1|Add18~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add18~9_combout\,
	combout => \C1|SQ_Y3[4]~5_combout\);

-- Location: FF_X59_Y42_N3
\C1|SQ_Y3[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y3[4]~5_combout\,
	ena => \C1|SQ_Y3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y3\(4));

-- Location: LCCOMB_X60_Y42_N18
\C1|Add18~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add18~11_combout\ = (\KEY[3]~input_o\ & ((\C1|SQ_Y3\(5) & ((\C1|Add18~10\) # (GND))) # (!\C1|SQ_Y3\(5) & (!\C1|Add18~10\)))) # (!\KEY[3]~input_o\ & ((\C1|SQ_Y3\(5) & (!\C1|Add18~10\)) # (!\C1|SQ_Y3\(5) & (\C1|Add18~10\ & VCC))))
-- \C1|Add18~12\ = CARRY((\KEY[3]~input_o\ & ((\C1|SQ_Y3\(5)) # (!\C1|Add18~10\))) # (!\KEY[3]~input_o\ & (\C1|SQ_Y3\(5) & !\C1|Add18~10\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y3\(5),
	datad => VCC,
	cin => \C1|Add18~10\,
	combout => \C1|Add18~11_combout\,
	cout => \C1|Add18~12\);

-- Location: LCCOMB_X59_Y42_N28
\C1|SQ_Y3[5]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y3[5]~4_combout\ = !\C1|Add18~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add18~11_combout\,
	combout => \C1|SQ_Y3[5]~4_combout\);

-- Location: FF_X59_Y42_N29
\C1|SQ_Y3[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y3[5]~4_combout\,
	ena => \C1|SQ_Y3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y3\(5));

-- Location: LCCOMB_X60_Y42_N20
\C1|Add18~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add18~13_combout\ = ((\KEY[3]~input_o\ $ (\C1|SQ_Y3\(6) $ (\C1|Add18~12\)))) # (GND)
-- \C1|Add18~14\ = CARRY((\KEY[3]~input_o\ & (\C1|SQ_Y3\(6) & !\C1|Add18~12\)) # (!\KEY[3]~input_o\ & ((\C1|SQ_Y3\(6)) # (!\C1|Add18~12\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y3\(6),
	datad => VCC,
	cin => \C1|Add18~12\,
	combout => \C1|Add18~13_combout\,
	cout => \C1|Add18~14\);

-- Location: FF_X60_Y42_N21
\C1|SQ_Y3[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add18~13_combout\,
	ena => \C1|SQ_Y3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y3\(6));

-- Location: LCCOMB_X60_Y42_N22
\C1|Add18~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add18~15_combout\ = (\KEY[3]~input_o\ & ((\C1|SQ_Y3\(7) & ((\C1|Add18~14\) # (GND))) # (!\C1|SQ_Y3\(7) & (!\C1|Add18~14\)))) # (!\KEY[3]~input_o\ & ((\C1|SQ_Y3\(7) & (!\C1|Add18~14\)) # (!\C1|SQ_Y3\(7) & (\C1|Add18~14\ & VCC))))
-- \C1|Add18~16\ = CARRY((\KEY[3]~input_o\ & ((\C1|SQ_Y3\(7)) # (!\C1|Add18~14\))) # (!\KEY[3]~input_o\ & (\C1|SQ_Y3\(7) & !\C1|Add18~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y3\(7),
	datad => VCC,
	cin => \C1|Add18~14\,
	combout => \C1|Add18~15_combout\,
	cout => \C1|Add18~16\);

-- Location: LCCOMB_X59_Y42_N26
\C1|SQ_Y3[7]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y3[7]~3_combout\ = !\C1|Add18~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add18~15_combout\,
	combout => \C1|SQ_Y3[7]~3_combout\);

-- Location: FF_X59_Y42_N27
\C1|SQ_Y3[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y3[7]~3_combout\,
	ena => \C1|SQ_Y3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y3\(7));

-- Location: LCCOMB_X60_Y42_N24
\C1|Add18~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add18~17_combout\ = ((\KEY[3]~input_o\ $ (\C1|SQ_Y3\(8) $ (\C1|Add18~16\)))) # (GND)
-- \C1|Add18~18\ = CARRY((\KEY[3]~input_o\ & (\C1|SQ_Y3\(8) & !\C1|Add18~16\)) # (!\KEY[3]~input_o\ & ((\C1|SQ_Y3\(8)) # (!\C1|Add18~16\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y3\(8),
	datad => VCC,
	cin => \C1|Add18~16\,
	combout => \C1|Add18~17_combout\,
	cout => \C1|Add18~18\);

-- Location: FF_X60_Y42_N25
\C1|SQ_Y3[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add18~17_combout\,
	ena => \C1|SQ_Y3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y3\(8));

-- Location: LCCOMB_X60_Y42_N26
\C1|Add18~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add18~19_combout\ = (\KEY[3]~input_o\ & ((\C1|SQ_Y3\(9) & ((\C1|Add18~18\) # (GND))) # (!\C1|SQ_Y3\(9) & (!\C1|Add18~18\)))) # (!\KEY[3]~input_o\ & ((\C1|SQ_Y3\(9) & (!\C1|Add18~18\)) # (!\C1|SQ_Y3\(9) & (\C1|Add18~18\ & VCC))))
-- \C1|Add18~20\ = CARRY((\KEY[3]~input_o\ & ((\C1|SQ_Y3\(9)) # (!\C1|Add18~18\))) # (!\KEY[3]~input_o\ & (\C1|SQ_Y3\(9) & !\C1|Add18~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y3\(9),
	datad => VCC,
	cin => \C1|Add18~18\,
	combout => \C1|Add18~19_combout\,
	cout => \C1|Add18~20\);

-- Location: LCCOMB_X59_Y42_N0
\C1|SQ_Y3[9]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y3[9]~2_combout\ = !\C1|Add18~19_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|Add18~19_combout\,
	combout => \C1|SQ_Y3[9]~2_combout\);

-- Location: FF_X59_Y42_N1
\C1|SQ_Y3[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y3[9]~2_combout\,
	ena => \C1|SQ_Y3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y3\(9));

-- Location: LCCOMB_X60_Y42_N28
\C1|Add18~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add18~21_combout\ = \KEY[3]~input_o\ $ (\C1|Add18~20\ $ (\C1|SQ_Y3\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datad => \C1|SQ_Y3\(10),
	cin => \C1|Add18~20\,
	combout => \C1|Add18~21_combout\);

-- Location: FF_X60_Y42_N29
\C1|SQ_Y3[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add18~21_combout\,
	ena => \C1|SQ_Y3[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y3\(10));

-- Location: LCCOMB_X59_Y42_N8
\C1|Add5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add5~2_combout\ = (\C1|SQ_Y3\(3) & (!\C1|Add5~1\)) # (!\C1|SQ_Y3\(3) & (\C1|Add5~1\ & VCC))
-- \C1|Add5~3\ = CARRY((\C1|SQ_Y3\(3) & !\C1|Add5~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y3\(3),
	datad => VCC,
	cin => \C1|Add5~1\,
	combout => \C1|Add5~2_combout\,
	cout => \C1|Add5~3\);

-- Location: LCCOMB_X59_Y42_N10
\C1|Add5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add5~4_combout\ = (\C1|SQ_Y3\(4) & (!\C1|Add5~3\ & VCC)) # (!\C1|SQ_Y3\(4) & (\C1|Add5~3\ $ (GND)))
-- \C1|Add5~5\ = CARRY((!\C1|SQ_Y3\(4) & !\C1|Add5~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y3\(4),
	datad => VCC,
	cin => \C1|Add5~3\,
	combout => \C1|Add5~4_combout\,
	cout => \C1|Add5~5\);

-- Location: LCCOMB_X59_Y42_N12
\C1|Add5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add5~6_combout\ = (\C1|SQ_Y3\(5) & ((\C1|Add5~5\) # (GND))) # (!\C1|SQ_Y3\(5) & (!\C1|Add5~5\))
-- \C1|Add5~7\ = CARRY((\C1|SQ_Y3\(5)) # (!\C1|Add5~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y3\(5),
	datad => VCC,
	cin => \C1|Add5~5\,
	combout => \C1|Add5~6_combout\,
	cout => \C1|Add5~7\);

-- Location: LCCOMB_X59_Y42_N16
\C1|Add5~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add5~10_combout\ = (\C1|SQ_Y3\(7) & ((\C1|Add5~9\) # (GND))) # (!\C1|SQ_Y3\(7) & (!\C1|Add5~9\))
-- \C1|Add5~11\ = CARRY((\C1|SQ_Y3\(7)) # (!\C1|Add5~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y3\(7),
	datad => VCC,
	cin => \C1|Add5~9\,
	combout => \C1|Add5~10_combout\,
	cout => \C1|Add5~11\);

-- Location: FF_X60_Y44_N21
\C1|VPOS[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|VPOS[8]~27_combout\,
	sclr => \C1|LessThan13~0_combout\,
	ena => \C1|LessThan12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|VPOS\(8));

-- Location: LCCOMB_X59_Y43_N10
\C1|LessThan11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan11~1_cout\ = CARRY((!\C1|VPOS\(0) & \C1|SQ_Y3\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(0),
	datab => \C1|SQ_Y3\(0),
	datad => VCC,
	cout => \C1|LessThan11~1_cout\);

-- Location: LCCOMB_X59_Y43_N12
\C1|LessThan11~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan11~3_cout\ = CARRY((\C1|VPOS\(1) & ((\C1|SQ_Y3\(1)) # (!\C1|LessThan11~1_cout\))) # (!\C1|VPOS\(1) & (\C1|SQ_Y3\(1) & !\C1|LessThan11~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(1),
	datab => \C1|SQ_Y3\(1),
	datad => VCC,
	cin => \C1|LessThan11~1_cout\,
	cout => \C1|LessThan11~3_cout\);

-- Location: LCCOMB_X59_Y43_N14
\C1|LessThan11~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan11~5_cout\ = CARRY((\C1|Add5~0_combout\ & ((!\C1|LessThan11~3_cout\) # (!\C1|VPOS\(2)))) # (!\C1|Add5~0_combout\ & (!\C1|VPOS\(2) & !\C1|LessThan11~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add5~0_combout\,
	datab => \C1|VPOS\(2),
	datad => VCC,
	cin => \C1|LessThan11~3_cout\,
	cout => \C1|LessThan11~5_cout\);

-- Location: LCCOMB_X59_Y43_N16
\C1|LessThan11~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan11~7_cout\ = CARRY((\C1|VPOS\(3) & ((!\C1|LessThan11~5_cout\) # (!\C1|Add5~2_combout\))) # (!\C1|VPOS\(3) & (!\C1|Add5~2_combout\ & !\C1|LessThan11~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(3),
	datab => \C1|Add5~2_combout\,
	datad => VCC,
	cin => \C1|LessThan11~5_cout\,
	cout => \C1|LessThan11~7_cout\);

-- Location: LCCOMB_X59_Y43_N18
\C1|LessThan11~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan11~9_cout\ = CARRY((\C1|VPOS\(4) & (\C1|Add5~4_combout\ & !\C1|LessThan11~7_cout\)) # (!\C1|VPOS\(4) & ((\C1|Add5~4_combout\) # (!\C1|LessThan11~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(4),
	datab => \C1|Add5~4_combout\,
	datad => VCC,
	cin => \C1|LessThan11~7_cout\,
	cout => \C1|LessThan11~9_cout\);

-- Location: LCCOMB_X59_Y43_N20
\C1|LessThan11~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan11~11_cout\ = CARRY((\C1|VPOS\(5) & ((!\C1|LessThan11~9_cout\) # (!\C1|Add5~6_combout\))) # (!\C1|VPOS\(5) & (!\C1|Add5~6_combout\ & !\C1|LessThan11~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(5),
	datab => \C1|Add5~6_combout\,
	datad => VCC,
	cin => \C1|LessThan11~9_cout\,
	cout => \C1|LessThan11~11_cout\);

-- Location: LCCOMB_X59_Y43_N22
\C1|LessThan11~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan11~13_cout\ = CARRY((\C1|Add5~8_combout\ & ((!\C1|LessThan11~11_cout\) # (!\C1|VPOS\(6)))) # (!\C1|Add5~8_combout\ & (!\C1|VPOS\(6) & !\C1|LessThan11~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add5~8_combout\,
	datab => \C1|VPOS\(6),
	datad => VCC,
	cin => \C1|LessThan11~11_cout\,
	cout => \C1|LessThan11~13_cout\);

-- Location: LCCOMB_X59_Y43_N24
\C1|LessThan11~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan11~15_cout\ = CARRY((\C1|VPOS\(7) & ((!\C1|LessThan11~13_cout\) # (!\C1|Add5~10_combout\))) # (!\C1|VPOS\(7) & (!\C1|Add5~10_combout\ & !\C1|LessThan11~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(7),
	datab => \C1|Add5~10_combout\,
	datad => VCC,
	cin => \C1|LessThan11~13_cout\,
	cout => \C1|LessThan11~15_cout\);

-- Location: LCCOMB_X59_Y43_N26
\C1|LessThan11~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan11~17_cout\ = CARRY((\C1|Add5~12_combout\ & ((!\C1|LessThan11~15_cout\) # (!\C1|VPOS\(8)))) # (!\C1|Add5~12_combout\ & (!\C1|VPOS\(8) & !\C1|LessThan11~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add5~12_combout\,
	datab => \C1|VPOS\(8),
	datad => VCC,
	cin => \C1|LessThan11~15_cout\,
	cout => \C1|LessThan11~17_cout\);

-- Location: LCCOMB_X59_Y43_N28
\C1|LessThan11~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan11~19_cout\ = CARRY((\C1|Add5~14_combout\ & (\C1|VPOS\(9) & !\C1|LessThan11~17_cout\)) # (!\C1|Add5~14_combout\ & ((\C1|VPOS\(9)) # (!\C1|LessThan11~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add5~14_combout\,
	datab => \C1|VPOS\(9),
	datad => VCC,
	cin => \C1|LessThan11~17_cout\,
	cout => \C1|LessThan11~19_cout\);

-- Location: LCCOMB_X59_Y43_N30
\C1|LessThan11~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan11~20_combout\ = (\C1|VPOS\(10) & (!\C1|LessThan11~19_cout\ & \C1|Add5~16_combout\)) # (!\C1|VPOS\(10) & ((\C1|Add5~16_combout\) # (!\C1|LessThan11~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|VPOS\(10),
	datad => \C1|Add5~16_combout\,
	cin => \C1|LessThan11~19_cout\,
	combout => \C1|LessThan11~20_combout\);

-- Location: LCCOMB_X62_Y45_N6
\C1|LessThan9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan9~1_cout\ = CARRY((!\C1|HPOS\(0) & \C1|SQ_X3\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(0),
	datab => \C1|SQ_X3\(0),
	datad => VCC,
	cout => \C1|LessThan9~1_cout\);

-- Location: LCCOMB_X62_Y45_N8
\C1|LessThan9~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan9~3_cout\ = CARRY((\C1|HPOS\(1) & ((!\C1|LessThan9~1_cout\) # (!\C1|SQ_X3\(1)))) # (!\C1|HPOS\(1) & (!\C1|SQ_X3\(1) & !\C1|LessThan9~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(1),
	datab => \C1|SQ_X3\(1),
	datad => VCC,
	cin => \C1|LessThan9~1_cout\,
	cout => \C1|LessThan9~3_cout\);

-- Location: LCCOMB_X62_Y45_N10
\C1|LessThan9~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan9~5_cout\ = CARRY((\C1|HPOS\(2) & (\C1|SQ_X3\(2) & !\C1|LessThan9~3_cout\)) # (!\C1|HPOS\(2) & ((\C1|SQ_X3\(2)) # (!\C1|LessThan9~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(2),
	datab => \C1|SQ_X3\(2),
	datad => VCC,
	cin => \C1|LessThan9~3_cout\,
	cout => \C1|LessThan9~5_cout\);

-- Location: LCCOMB_X62_Y45_N12
\C1|LessThan9~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan9~7_cout\ = CARRY((\C1|HPOS\(3) & ((!\C1|LessThan9~5_cout\) # (!\C1|Add4~0_combout\))) # (!\C1|HPOS\(3) & (!\C1|Add4~0_combout\ & !\C1|LessThan9~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(3),
	datab => \C1|Add4~0_combout\,
	datad => VCC,
	cin => \C1|LessThan9~5_cout\,
	cout => \C1|LessThan9~7_cout\);

-- Location: LCCOMB_X62_Y45_N14
\C1|LessThan9~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan9~9_cout\ = CARRY((\C1|HPOS\(4) & (\C1|Add4~2_combout\ & !\C1|LessThan9~7_cout\)) # (!\C1|HPOS\(4) & ((\C1|Add4~2_combout\) # (!\C1|LessThan9~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(4),
	datab => \C1|Add4~2_combout\,
	datad => VCC,
	cin => \C1|LessThan9~7_cout\,
	cout => \C1|LessThan9~9_cout\);

-- Location: LCCOMB_X62_Y45_N16
\C1|LessThan9~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan9~11_cout\ = CARRY((\C1|Add4~4_combout\ & (\C1|HPOS\(5) & !\C1|LessThan9~9_cout\)) # (!\C1|Add4~4_combout\ & ((\C1|HPOS\(5)) # (!\C1|LessThan9~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add4~4_combout\,
	datab => \C1|HPOS\(5),
	datad => VCC,
	cin => \C1|LessThan9~9_cout\,
	cout => \C1|LessThan9~11_cout\);

-- Location: LCCOMB_X62_Y45_N18
\C1|LessThan9~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan9~13_cout\ = CARRY((\C1|Add4~6_combout\ & ((!\C1|LessThan9~11_cout\) # (!\C1|HPOS\(6)))) # (!\C1|Add4~6_combout\ & (!\C1|HPOS\(6) & !\C1|LessThan9~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add4~6_combout\,
	datab => \C1|HPOS\(6),
	datad => VCC,
	cin => \C1|LessThan9~11_cout\,
	cout => \C1|LessThan9~13_cout\);

-- Location: LCCOMB_X62_Y45_N20
\C1|LessThan9~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan9~15_cout\ = CARRY((\C1|Add4~8_combout\ & (\C1|HPOS\(7) & !\C1|LessThan9~13_cout\)) # (!\C1|Add4~8_combout\ & ((\C1|HPOS\(7)) # (!\C1|LessThan9~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add4~8_combout\,
	datab => \C1|HPOS\(7),
	datad => VCC,
	cin => \C1|LessThan9~13_cout\,
	cout => \C1|LessThan9~15_cout\);

-- Location: LCCOMB_X62_Y45_N22
\C1|LessThan9~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan9~17_cout\ = CARRY((\C1|Add4~10_combout\ & ((!\C1|LessThan9~15_cout\) # (!\C1|HPOS\(8)))) # (!\C1|Add4~10_combout\ & (!\C1|HPOS\(8) & !\C1|LessThan9~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add4~10_combout\,
	datab => \C1|HPOS\(8),
	datad => VCC,
	cin => \C1|LessThan9~15_cout\,
	cout => \C1|LessThan9~17_cout\);

-- Location: LCCOMB_X62_Y45_N24
\C1|LessThan9~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan9~19_cout\ = CARRY((\C1|Add4~12_combout\ & (\C1|HPOS\(9) & !\C1|LessThan9~17_cout\)) # (!\C1|Add4~12_combout\ & ((\C1|HPOS\(9)) # (!\C1|LessThan9~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add4~12_combout\,
	datab => \C1|HPOS\(9),
	datad => VCC,
	cin => \C1|LessThan9~17_cout\,
	cout => \C1|LessThan9~19_cout\);

-- Location: LCCOMB_X62_Y45_N26
\C1|LessThan9~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan9~20_combout\ = (\C1|HPOS\(10) & (!\C1|LessThan9~19_cout\ & \C1|Add4~14_combout\)) # (!\C1|HPOS\(10) & ((\C1|Add4~14_combout\) # (!\C1|LessThan9~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(10),
	datad => \C1|Add4~14_combout\,
	cin => \C1|LessThan9~19_cout\,
	combout => \C1|LessThan9~20_combout\);

-- Location: LCCOMB_X61_Y44_N18
\C1|DRAW3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|DRAW3~0_combout\ = (\C1|Add5~18_combout\ & ((\C1|Add4~16_combout\) # ((\C1|LessThan9~20_combout\)))) # (!\C1|Add5~18_combout\ & (\C1|LessThan11~20_combout\ & ((\C1|Add4~16_combout\) # (\C1|LessThan9~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add5~18_combout\,
	datab => \C1|Add4~16_combout\,
	datac => \C1|LessThan11~20_combout\,
	datad => \C1|LessThan9~20_combout\,
	combout => \C1|DRAW3~0_combout\);

-- Location: LCCOMB_X61_Y44_N16
\C1|B~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|B~2_combout\ = (\C1|LessThan10~20_combout\ & (\C1|LessThan8~20_combout\ & (\C1|B~0_combout\ & \C1|DRAW3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|LessThan10~20_combout\,
	datab => \C1|LessThan8~20_combout\,
	datac => \C1|B~0_combout\,
	datad => \C1|DRAW3~0_combout\,
	combout => \C1|B~2_combout\);

-- Location: LCCOMB_X60_Y43_N2
\C1|Add8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add8~1_combout\ = \C1|SQ_X1\(0) $ (VCC)
-- \C1|Add8~2\ = CARRY(\C1|SQ_X1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X1\(0),
	datad => VCC,
	combout => \C1|Add8~1_combout\,
	cout => \C1|Add8~2\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X60_Y43_N24
\C1|SQ_X1[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X1[10]~0_combout\ = (\C1|SQ_X3[10]~0_combout\ & \SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|SQ_X3[10]~0_combout\,
	datad => \SW[0]~input_o\,
	combout => \C1|SQ_X1[10]~0_combout\);

-- Location: FF_X60_Y43_N3
\C1|SQ_X1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add8~1_combout\,
	ena => \C1|SQ_X1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X1\(0));

-- Location: LCCOMB_X60_Y43_N4
\C1|Add8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add8~3_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X1\(1) & (!\C1|Add8~2\)) # (!\C1|SQ_X1\(1) & ((\C1|Add8~2\) # (GND))))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X1\(1) & (\C1|Add8~2\ & VCC)) # (!\C1|SQ_X1\(1) & (!\C1|Add8~2\))))
-- \C1|Add8~4\ = CARRY((\KEY[1]~input_o\ & ((!\C1|Add8~2\) # (!\C1|SQ_X1\(1)))) # (!\KEY[1]~input_o\ & (!\C1|SQ_X1\(1) & !\C1|Add8~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X1\(1),
	datad => VCC,
	cin => \C1|Add8~2\,
	combout => \C1|Add8~3_combout\,
	cout => \C1|Add8~4\);

-- Location: FF_X60_Y43_N5
\C1|SQ_X1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add8~3_combout\,
	ena => \C1|SQ_X1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X1\(1));

-- Location: LCCOMB_X60_Y43_N6
\C1|Add8~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add8~5_combout\ = ((\KEY[1]~input_o\ $ (\C1|SQ_X1\(2) $ (!\C1|Add8~4\)))) # (GND)
-- \C1|Add8~6\ = CARRY((\KEY[1]~input_o\ & ((\C1|SQ_X1\(2)) # (!\C1|Add8~4\))) # (!\KEY[1]~input_o\ & (\C1|SQ_X1\(2) & !\C1|Add8~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X1\(2),
	datad => VCC,
	cin => \C1|Add8~4\,
	combout => \C1|Add8~5_combout\,
	cout => \C1|Add8~6\);

-- Location: FF_X60_Y43_N7
\C1|SQ_X1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add8~5_combout\,
	ena => \C1|SQ_X1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X1\(2));

-- Location: LCCOMB_X60_Y43_N8
\C1|Add8~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add8~7_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X1\(3) & ((\C1|Add8~6\) # (GND))) # (!\C1|SQ_X1\(3) & (!\C1|Add8~6\)))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X1\(3) & (!\C1|Add8~6\)) # (!\C1|SQ_X1\(3) & (\C1|Add8~6\ & VCC))))
-- \C1|Add8~8\ = CARRY((\KEY[1]~input_o\ & ((\C1|SQ_X1\(3)) # (!\C1|Add8~6\))) # (!\KEY[1]~input_o\ & (\C1|SQ_X1\(3) & !\C1|Add8~6\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X1\(3),
	datad => VCC,
	cin => \C1|Add8~6\,
	combout => \C1|Add8~7_combout\,
	cout => \C1|Add8~8\);

-- Location: LCCOMB_X58_Y43_N0
\C1|SQ_X1[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X1[3]~4_combout\ = !\C1|Add8~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add8~7_combout\,
	combout => \C1|SQ_X1[3]~4_combout\);

-- Location: FF_X58_Y43_N1
\C1|SQ_X1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X1[3]~4_combout\,
	ena => \C1|SQ_X1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X1\(3));

-- Location: LCCOMB_X60_Y43_N10
\C1|Add8~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add8~9_combout\ = ((\KEY[1]~input_o\ $ (\C1|SQ_X1\(4) $ (!\C1|Add8~8\)))) # (GND)
-- \C1|Add8~10\ = CARRY((\KEY[1]~input_o\ & (!\C1|SQ_X1\(4) & !\C1|Add8~8\)) # (!\KEY[1]~input_o\ & ((!\C1|Add8~8\) # (!\C1|SQ_X1\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X1\(4),
	datad => VCC,
	cin => \C1|Add8~8\,
	combout => \C1|Add8~9_combout\,
	cout => \C1|Add8~10\);

-- Location: LCCOMB_X58_Y43_N30
\C1|SQ_X1[4]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X1[4]~3_combout\ = !\C1|Add8~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add8~9_combout\,
	combout => \C1|SQ_X1[4]~3_combout\);

-- Location: FF_X58_Y43_N31
\C1|SQ_X1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X1[4]~3_combout\,
	ena => \C1|SQ_X1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X1\(4));

-- Location: LCCOMB_X60_Y43_N12
\C1|Add8~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add8~11_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X1\(5) & (!\C1|Add8~10\)) # (!\C1|SQ_X1\(5) & ((\C1|Add8~10\) # (GND))))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X1\(5) & (\C1|Add8~10\ & VCC)) # (!\C1|SQ_X1\(5) & (!\C1|Add8~10\))))
-- \C1|Add8~12\ = CARRY((\KEY[1]~input_o\ & ((!\C1|Add8~10\) # (!\C1|SQ_X1\(5)))) # (!\KEY[1]~input_o\ & (!\C1|SQ_X1\(5) & !\C1|Add8~10\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X1\(5),
	datad => VCC,
	cin => \C1|Add8~10\,
	combout => \C1|Add8~11_combout\,
	cout => \C1|Add8~12\);

-- Location: FF_X60_Y43_N13
\C1|SQ_X1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add8~11_combout\,
	ena => \C1|SQ_X1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X1\(5));

-- Location: LCCOMB_X60_Y43_N14
\C1|Add8~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add8~13_combout\ = ((\KEY[1]~input_o\ $ (\C1|SQ_X1\(6) $ (!\C1|Add8~12\)))) # (GND)
-- \C1|Add8~14\ = CARRY((\KEY[1]~input_o\ & (!\C1|SQ_X1\(6) & !\C1|Add8~12\)) # (!\KEY[1]~input_o\ & ((!\C1|Add8~12\) # (!\C1|SQ_X1\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X1\(6),
	datad => VCC,
	cin => \C1|Add8~12\,
	combout => \C1|Add8~13_combout\,
	cout => \C1|Add8~14\);

-- Location: LCCOMB_X58_Y43_N28
\C1|SQ_X1[6]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X1[6]~2_combout\ = !\C1|Add8~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add8~13_combout\,
	combout => \C1|SQ_X1[6]~2_combout\);

-- Location: FF_X58_Y43_N29
\C1|SQ_X1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X1[6]~2_combout\,
	ena => \C1|SQ_X1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X1\(6));

-- Location: LCCOMB_X60_Y43_N16
\C1|Add8~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add8~15_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X1\(7) & (!\C1|Add8~14\)) # (!\C1|SQ_X1\(7) & ((\C1|Add8~14\) # (GND))))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X1\(7) & (\C1|Add8~14\ & VCC)) # (!\C1|SQ_X1\(7) & (!\C1|Add8~14\))))
-- \C1|Add8~16\ = CARRY((\KEY[1]~input_o\ & ((!\C1|Add8~14\) # (!\C1|SQ_X1\(7)))) # (!\KEY[1]~input_o\ & (!\C1|SQ_X1\(7) & !\C1|Add8~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X1\(7),
	datad => VCC,
	cin => \C1|Add8~14\,
	combout => \C1|Add8~15_combout\,
	cout => \C1|Add8~16\);

-- Location: FF_X60_Y43_N17
\C1|SQ_X1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add8~15_combout\,
	ena => \C1|SQ_X1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X1\(7));

-- Location: LCCOMB_X60_Y43_N18
\C1|Add8~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add8~17_combout\ = ((\KEY[1]~input_o\ $ (\C1|SQ_X1\(8) $ (\C1|Add8~16\)))) # (GND)
-- \C1|Add8~18\ = CARRY((\KEY[1]~input_o\ & (\C1|SQ_X1\(8) & !\C1|Add8~16\)) # (!\KEY[1]~input_o\ & ((\C1|SQ_X1\(8)) # (!\C1|Add8~16\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X1\(8),
	datad => VCC,
	cin => \C1|Add8~16\,
	combout => \C1|Add8~17_combout\,
	cout => \C1|Add8~18\);

-- Location: FF_X60_Y43_N19
\C1|SQ_X1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add8~17_combout\,
	ena => \C1|SQ_X1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X1\(8));

-- Location: LCCOMB_X60_Y43_N20
\C1|Add8~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add8~19_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X1\(9) & ((\C1|Add8~18\) # (GND))) # (!\C1|SQ_X1\(9) & (!\C1|Add8~18\)))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X1\(9) & (!\C1|Add8~18\)) # (!\C1|SQ_X1\(9) & (\C1|Add8~18\ & VCC))))
-- \C1|Add8~20\ = CARRY((\KEY[1]~input_o\ & ((\C1|SQ_X1\(9)) # (!\C1|Add8~18\))) # (!\KEY[1]~input_o\ & (\C1|SQ_X1\(9) & !\C1|Add8~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X1\(9),
	datad => VCC,
	cin => \C1|Add8~18\,
	combout => \C1|Add8~19_combout\,
	cout => \C1|Add8~20\);

-- Location: LCCOMB_X58_Y43_N24
\C1|SQ_X1[9]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X1[9]~1_combout\ = !\C1|Add8~19_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add8~19_combout\,
	combout => \C1|SQ_X1[9]~1_combout\);

-- Location: FF_X58_Y43_N25
\C1|SQ_X1[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X1[9]~1_combout\,
	ena => \C1|SQ_X1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X1\(9));

-- Location: LCCOMB_X60_Y43_N22
\C1|Add8~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add8~21_combout\ = \C1|SQ_X1\(10) $ (\C1|Add8~20\ $ (\KEY[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X1\(10),
	datad => \KEY[1]~input_o\,
	cin => \C1|Add8~20\,
	combout => \C1|Add8~21_combout\);

-- Location: FF_X60_Y43_N23
\C1|SQ_X1[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add8~21_combout\,
	ena => \C1|SQ_X1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X1\(10));

-- Location: LCCOMB_X58_Y45_N4
\C1|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan0~1_cout\ = CARRY((\C1|HPOS\(0) & !\C1|SQ_X1\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(0),
	datab => \C1|SQ_X1\(0),
	datad => VCC,
	cout => \C1|LessThan0~1_cout\);

-- Location: LCCOMB_X58_Y45_N6
\C1|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan0~3_cout\ = CARRY((\C1|HPOS\(1) & (\C1|SQ_X1\(1) & !\C1|LessThan0~1_cout\)) # (!\C1|HPOS\(1) & ((\C1|SQ_X1\(1)) # (!\C1|LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(1),
	datab => \C1|SQ_X1\(1),
	datad => VCC,
	cin => \C1|LessThan0~1_cout\,
	cout => \C1|LessThan0~3_cout\);

-- Location: LCCOMB_X58_Y45_N8
\C1|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan0~5_cout\ = CARRY((\C1|SQ_X1\(2) & (\C1|HPOS\(2) & !\C1|LessThan0~3_cout\)) # (!\C1|SQ_X1\(2) & ((\C1|HPOS\(2)) # (!\C1|LessThan0~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X1\(2),
	datab => \C1|HPOS\(2),
	datad => VCC,
	cin => \C1|LessThan0~3_cout\,
	cout => \C1|LessThan0~5_cout\);

-- Location: LCCOMB_X58_Y45_N10
\C1|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan0~7_cout\ = CARRY((\C1|SQ_X1\(3) & (!\C1|HPOS\(3) & !\C1|LessThan0~5_cout\)) # (!\C1|SQ_X1\(3) & ((!\C1|LessThan0~5_cout\) # (!\C1|HPOS\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X1\(3),
	datab => \C1|HPOS\(3),
	datad => VCC,
	cin => \C1|LessThan0~5_cout\,
	cout => \C1|LessThan0~7_cout\);

-- Location: LCCOMB_X58_Y45_N12
\C1|LessThan0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan0~9_cout\ = CARRY((\C1|SQ_X1\(4) & ((\C1|HPOS\(4)) # (!\C1|LessThan0~7_cout\))) # (!\C1|SQ_X1\(4) & (\C1|HPOS\(4) & !\C1|LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X1\(4),
	datab => \C1|HPOS\(4),
	datad => VCC,
	cin => \C1|LessThan0~7_cout\,
	cout => \C1|LessThan0~9_cout\);

-- Location: LCCOMB_X58_Y45_N14
\C1|LessThan0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan0~11_cout\ = CARRY((\C1|HPOS\(5) & (\C1|SQ_X1\(5) & !\C1|LessThan0~9_cout\)) # (!\C1|HPOS\(5) & ((\C1|SQ_X1\(5)) # (!\C1|LessThan0~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(5),
	datab => \C1|SQ_X1\(5),
	datad => VCC,
	cin => \C1|LessThan0~9_cout\,
	cout => \C1|LessThan0~11_cout\);

-- Location: LCCOMB_X58_Y45_N16
\C1|LessThan0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan0~13_cout\ = CARRY((\C1|HPOS\(6) & ((\C1|SQ_X1\(6)) # (!\C1|LessThan0~11_cout\))) # (!\C1|HPOS\(6) & (\C1|SQ_X1\(6) & !\C1|LessThan0~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(6),
	datab => \C1|SQ_X1\(6),
	datad => VCC,
	cin => \C1|LessThan0~11_cout\,
	cout => \C1|LessThan0~13_cout\);

-- Location: LCCOMB_X58_Y45_N18
\C1|LessThan0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan0~15_cout\ = CARRY((\C1|SQ_X1\(7) & ((!\C1|LessThan0~13_cout\) # (!\C1|HPOS\(7)))) # (!\C1|SQ_X1\(7) & (!\C1|HPOS\(7) & !\C1|LessThan0~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X1\(7),
	datab => \C1|HPOS\(7),
	datad => VCC,
	cin => \C1|LessThan0~13_cout\,
	cout => \C1|LessThan0~15_cout\);

-- Location: LCCOMB_X58_Y45_N20
\C1|LessThan0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan0~17_cout\ = CARRY((\C1|HPOS\(8) & ((!\C1|LessThan0~15_cout\) # (!\C1|SQ_X1\(8)))) # (!\C1|HPOS\(8) & (!\C1|SQ_X1\(8) & !\C1|LessThan0~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(8),
	datab => \C1|SQ_X1\(8),
	datad => VCC,
	cin => \C1|LessThan0~15_cout\,
	cout => \C1|LessThan0~17_cout\);

-- Location: LCCOMB_X58_Y45_N22
\C1|LessThan0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan0~19_cout\ = CARRY((\C1|SQ_X1\(9) & (!\C1|HPOS\(9) & !\C1|LessThan0~17_cout\)) # (!\C1|SQ_X1\(9) & ((!\C1|LessThan0~17_cout\) # (!\C1|HPOS\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X1\(9),
	datab => \C1|HPOS\(9),
	datad => VCC,
	cin => \C1|LessThan0~17_cout\,
	cout => \C1|LessThan0~19_cout\);

-- Location: LCCOMB_X58_Y45_N24
\C1|LessThan0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan0~20_combout\ = (\C1|HPOS\(10) & ((!\C1|SQ_X1\(10)) # (!\C1|LessThan0~19_cout\))) # (!\C1|HPOS\(10) & (!\C1|LessThan0~19_cout\ & !\C1|SQ_X1\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(10),
	datad => \C1|SQ_X1\(10),
	cin => \C1|LessThan0~19_cout\,
	combout => \C1|LessThan0~20_combout\);

-- Location: LCCOMB_X58_Y43_N2
\C1|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add0~0_combout\ = (\C1|SQ_X1\(3) & (\C1|SQ_X1\(2) & VCC)) # (!\C1|SQ_X1\(3) & (\C1|SQ_X1\(2) $ (VCC)))
-- \C1|Add0~1\ = CARRY((!\C1|SQ_X1\(3) & \C1|SQ_X1\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X1\(3),
	datab => \C1|SQ_X1\(2),
	datad => VCC,
	combout => \C1|Add0~0_combout\,
	cout => \C1|Add0~1\);

-- Location: LCCOMB_X58_Y43_N4
\C1|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add0~2_combout\ = (\C1|SQ_X1\(4) & ((\C1|Add0~1\) # (GND))) # (!\C1|SQ_X1\(4) & (!\C1|Add0~1\))
-- \C1|Add0~3\ = CARRY((\C1|SQ_X1\(4)) # (!\C1|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X1\(4),
	datad => VCC,
	cin => \C1|Add0~1\,
	combout => \C1|Add0~2_combout\,
	cout => \C1|Add0~3\);

-- Location: LCCOMB_X58_Y43_N6
\C1|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add0~4_combout\ = (\C1|SQ_X1\(5) & ((GND) # (!\C1|Add0~3\))) # (!\C1|SQ_X1\(5) & (\C1|Add0~3\ $ (GND)))
-- \C1|Add0~5\ = CARRY((\C1|SQ_X1\(5)) # (!\C1|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X1\(5),
	datad => VCC,
	cin => \C1|Add0~3\,
	combout => \C1|Add0~4_combout\,
	cout => \C1|Add0~5\);

-- Location: LCCOMB_X58_Y43_N12
\C1|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add0~10_combout\ = (\C1|SQ_X1\(8) & (!\C1|Add0~9\)) # (!\C1|SQ_X1\(8) & ((\C1|Add0~9\) # (GND)))
-- \C1|Add0~11\ = CARRY((!\C1|Add0~9\) # (!\C1|SQ_X1\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X1\(8),
	datad => VCC,
	cin => \C1|Add0~9\,
	combout => \C1|Add0~10_combout\,
	cout => \C1|Add0~11\);

-- Location: LCCOMB_X58_Y43_N14
\C1|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add0~12_combout\ = (\C1|SQ_X1\(9) & (!\C1|Add0~11\ & VCC)) # (!\C1|SQ_X1\(9) & (\C1|Add0~11\ $ (GND)))
-- \C1|Add0~13\ = CARRY((!\C1|SQ_X1\(9) & !\C1|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_X1\(9),
	datad => VCC,
	cin => \C1|Add0~11\,
	combout => \C1|Add0~12_combout\,
	cout => \C1|Add0~13\);

-- Location: LCCOMB_X58_Y43_N16
\C1|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add0~14_combout\ = (\C1|SQ_X1\(10) & (!\C1|Add0~13\)) # (!\C1|SQ_X1\(10) & ((\C1|Add0~13\) # (GND)))
-- \C1|Add0~15\ = CARRY((!\C1|Add0~13\) # (!\C1|SQ_X1\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X1\(10),
	datad => VCC,
	cin => \C1|Add0~13\,
	combout => \C1|Add0~14_combout\,
	cout => \C1|Add0~15\);

-- Location: LCCOMB_X58_Y43_N18
\C1|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add0~16_combout\ = !\C1|Add0~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \C1|Add0~15\,
	combout => \C1|Add0~16_combout\);

-- Location: IOIBUF_X115_Y35_N22
\KEY[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: LCCOMB_X62_Y43_N10
\C1|Add10~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add10~5_combout\ = ((\C1|SQ_Y1\(2) $ (\KEY[3]~input_o\ $ (!\C1|Add10~4\)))) # (GND)
-- \C1|Add10~6\ = CARRY((\C1|SQ_Y1\(2) & ((\KEY[3]~input_o\) # (!\C1|Add10~4\))) # (!\C1|SQ_Y1\(2) & (\KEY[3]~input_o\ & !\C1|Add10~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(2),
	datab => \KEY[3]~input_o\,
	datad => VCC,
	cin => \C1|Add10~4\,
	combout => \C1|Add10~5_combout\,
	cout => \C1|Add10~6\);

-- Location: LCCOMB_X62_Y43_N14
\C1|Add10~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add10~9_combout\ = ((\C1|SQ_Y1\(4) $ (\KEY[3]~input_o\ $ (!\C1|Add10~8\)))) # (GND)
-- \C1|Add10~10\ = CARRY((\C1|SQ_Y1\(4) & (!\KEY[3]~input_o\ & !\C1|Add10~8\)) # (!\C1|SQ_Y1\(4) & ((!\C1|Add10~8\) # (!\KEY[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(4),
	datab => \KEY[3]~input_o\,
	datad => VCC,
	cin => \C1|Add10~8\,
	combout => \C1|Add10~9_combout\,
	cout => \C1|Add10~10\);

-- Location: LCCOMB_X62_Y43_N18
\C1|Add10~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add10~13_combout\ = ((\C1|SQ_Y1\(6) $ (\KEY[3]~input_o\ $ (!\C1|Add10~12\)))) # (GND)
-- \C1|Add10~14\ = CARRY((\C1|SQ_Y1\(6) & (!\KEY[3]~input_o\ & !\C1|Add10~12\)) # (!\C1|SQ_Y1\(6) & ((!\C1|Add10~12\) # (!\KEY[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(6),
	datab => \KEY[3]~input_o\,
	datad => VCC,
	cin => \C1|Add10~12\,
	combout => \C1|Add10~13_combout\,
	cout => \C1|Add10~14\);

-- Location: LCCOMB_X62_Y43_N24
\C1|Add10~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add10~19_combout\ = (\C1|SQ_Y1\(9) & ((\KEY[3]~input_o\ & ((\C1|Add10~18\) # (GND))) # (!\KEY[3]~input_o\ & (!\C1|Add10~18\)))) # (!\C1|SQ_Y1\(9) & ((\KEY[3]~input_o\ & (!\C1|Add10~18\)) # (!\KEY[3]~input_o\ & (\C1|Add10~18\ & VCC))))
-- \C1|Add10~20\ = CARRY((\C1|SQ_Y1\(9) & ((\KEY[3]~input_o\) # (!\C1|Add10~18\))) # (!\C1|SQ_Y1\(9) & (\KEY[3]~input_o\ & !\C1|Add10~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(9),
	datab => \KEY[3]~input_o\,
	datad => VCC,
	cin => \C1|Add10~18\,
	combout => \C1|Add10~19_combout\,
	cout => \C1|Add10~20\);

-- Location: LCCOMB_X62_Y43_N26
\C1|Add10~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add10~21_combout\ = \C1|SQ_Y1\(10) $ (\KEY[3]~input_o\ $ (\C1|Add10~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(10),
	datab => \KEY[3]~input_o\,
	cin => \C1|Add10~20\,
	combout => \C1|Add10~21_combout\);

-- Location: LCCOMB_X60_Y43_N0
\C1|SQ_Y1[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y1[10]~0_combout\ = (\C1|SQ_Y3[10]~0_combout\ & \SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|SQ_Y3[10]~0_combout\,
	datad => \SW[0]~input_o\,
	combout => \C1|SQ_Y1[10]~0_combout\);

-- Location: FF_X62_Y43_N27
\C1|SQ_Y1[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add10~21_combout\,
	ena => \C1|SQ_Y1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y1\(10));

-- Location: LCCOMB_X63_Y44_N0
\C1|SQ_Y1[9]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y1[9]~1_combout\ = !\C1|Add10~19_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|Add10~19_combout\,
	combout => \C1|SQ_Y1[9]~1_combout\);

-- Location: FF_X63_Y44_N1
\C1|SQ_Y1[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y1[9]~1_combout\,
	ena => \C1|SQ_Y1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y1\(9));

-- Location: LCCOMB_X63_Y44_N2
\C1|SQ_Y1[6]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y1[6]~2_combout\ = !\C1|Add10~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add10~13_combout\,
	combout => \C1|SQ_Y1[6]~2_combout\);

-- Location: FF_X63_Y44_N3
\C1|SQ_Y1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y1[6]~2_combout\,
	ena => \C1|SQ_Y1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y1\(6));

-- Location: LCCOMB_X63_Y44_N28
\C1|SQ_Y1[4]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y1[4]~3_combout\ = !\C1|Add10~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add10~9_combout\,
	combout => \C1|SQ_Y1[4]~3_combout\);

-- Location: FF_X63_Y44_N29
\C1|SQ_Y1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y1[4]~3_combout\,
	ena => \C1|SQ_Y1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y1\(4));

-- Location: FF_X62_Y43_N11
\C1|SQ_Y1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add10~5_combout\,
	ena => \C1|SQ_Y1[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y1\(2));

-- Location: LCCOMB_X63_Y44_N10
\C1|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add1~2_combout\ = (\C1|SQ_Y1\(3) & (!\C1|Add1~1\)) # (!\C1|SQ_Y1\(3) & (\C1|Add1~1\ & VCC))
-- \C1|Add1~3\ = CARRY((\C1|SQ_Y1\(3) & !\C1|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(3),
	datad => VCC,
	cin => \C1|Add1~1\,
	combout => \C1|Add1~2_combout\,
	cout => \C1|Add1~3\);

-- Location: LCCOMB_X63_Y44_N12
\C1|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add1~4_combout\ = (\C1|SQ_Y1\(4) & (!\C1|Add1~3\ & VCC)) # (!\C1|SQ_Y1\(4) & (\C1|Add1~3\ $ (GND)))
-- \C1|Add1~5\ = CARRY((!\C1|SQ_Y1\(4) & !\C1|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y1\(4),
	datad => VCC,
	cin => \C1|Add1~3\,
	combout => \C1|Add1~4_combout\,
	cout => \C1|Add1~5\);

-- Location: LCCOMB_X63_Y44_N14
\C1|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add1~6_combout\ = (\C1|SQ_Y1\(5) & (!\C1|Add1~5\)) # (!\C1|SQ_Y1\(5) & ((\C1|Add1~5\) # (GND)))
-- \C1|Add1~7\ = CARRY((!\C1|Add1~5\) # (!\C1|SQ_Y1\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(5),
	datad => VCC,
	cin => \C1|Add1~5\,
	combout => \C1|Add1~6_combout\,
	cout => \C1|Add1~7\);

-- Location: LCCOMB_X63_Y44_N16
\C1|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add1~8_combout\ = (\C1|SQ_Y1\(6) & (!\C1|Add1~7\ & VCC)) # (!\C1|SQ_Y1\(6) & (\C1|Add1~7\ $ (GND)))
-- \C1|Add1~9\ = CARRY((!\C1|SQ_Y1\(6) & !\C1|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y1\(6),
	datad => VCC,
	cin => \C1|Add1~7\,
	combout => \C1|Add1~8_combout\,
	cout => \C1|Add1~9\);

-- Location: LCCOMB_X63_Y44_N18
\C1|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add1~10_combout\ = (\C1|SQ_Y1\(7) & (!\C1|Add1~9\)) # (!\C1|SQ_Y1\(7) & ((\C1|Add1~9\) # (GND)))
-- \C1|Add1~11\ = CARRY((!\C1|Add1~9\) # (!\C1|SQ_Y1\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(7),
	datad => VCC,
	cin => \C1|Add1~9\,
	combout => \C1|Add1~10_combout\,
	cout => \C1|Add1~11\);

-- Location: LCCOMB_X63_Y44_N22
\C1|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add1~14_combout\ = (\C1|SQ_Y1\(9) & ((\C1|Add1~13\) # (GND))) # (!\C1|SQ_Y1\(9) & (!\C1|Add1~13\))
-- \C1|Add1~15\ = CARRY((\C1|SQ_Y1\(9)) # (!\C1|Add1~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y1\(9),
	datad => VCC,
	cin => \C1|Add1~13\,
	combout => \C1|Add1~14_combout\,
	cout => \C1|Add1~15\);

-- Location: LCCOMB_X62_Y44_N10
\C1|LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan3~1_cout\ = CARRY((\C1|SQ_Y1\(0) & !\C1|VPOS\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(0),
	datab => \C1|VPOS\(0),
	datad => VCC,
	cout => \C1|LessThan3~1_cout\);

-- Location: LCCOMB_X62_Y44_N12
\C1|LessThan3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan3~3_cout\ = CARRY((\C1|SQ_Y1\(1) & ((\C1|VPOS\(1)) # (!\C1|LessThan3~1_cout\))) # (!\C1|SQ_Y1\(1) & (\C1|VPOS\(1) & !\C1|LessThan3~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y1\(1),
	datab => \C1|VPOS\(1),
	datad => VCC,
	cin => \C1|LessThan3~1_cout\,
	cout => \C1|LessThan3~3_cout\);

-- Location: LCCOMB_X62_Y44_N14
\C1|LessThan3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan3~5_cout\ = CARRY((\C1|Add1~0_combout\ & ((!\C1|LessThan3~3_cout\) # (!\C1|VPOS\(2)))) # (!\C1|Add1~0_combout\ & (!\C1|VPOS\(2) & !\C1|LessThan3~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add1~0_combout\,
	datab => \C1|VPOS\(2),
	datad => VCC,
	cin => \C1|LessThan3~3_cout\,
	cout => \C1|LessThan3~5_cout\);

-- Location: LCCOMB_X62_Y44_N16
\C1|LessThan3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan3~7_cout\ = CARRY((\C1|VPOS\(3) & ((!\C1|LessThan3~5_cout\) # (!\C1|Add1~2_combout\))) # (!\C1|VPOS\(3) & (!\C1|Add1~2_combout\ & !\C1|LessThan3~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(3),
	datab => \C1|Add1~2_combout\,
	datad => VCC,
	cin => \C1|LessThan3~5_cout\,
	cout => \C1|LessThan3~7_cout\);

-- Location: LCCOMB_X62_Y44_N18
\C1|LessThan3~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan3~9_cout\ = CARRY((\C1|VPOS\(4) & (\C1|Add1~4_combout\ & !\C1|LessThan3~7_cout\)) # (!\C1|VPOS\(4) & ((\C1|Add1~4_combout\) # (!\C1|LessThan3~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(4),
	datab => \C1|Add1~4_combout\,
	datad => VCC,
	cin => \C1|LessThan3~7_cout\,
	cout => \C1|LessThan3~9_cout\);

-- Location: LCCOMB_X62_Y44_N20
\C1|LessThan3~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan3~11_cout\ = CARRY((\C1|VPOS\(5) & ((!\C1|LessThan3~9_cout\) # (!\C1|Add1~6_combout\))) # (!\C1|VPOS\(5) & (!\C1|Add1~6_combout\ & !\C1|LessThan3~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(5),
	datab => \C1|Add1~6_combout\,
	datad => VCC,
	cin => \C1|LessThan3~9_cout\,
	cout => \C1|LessThan3~11_cout\);

-- Location: LCCOMB_X62_Y44_N22
\C1|LessThan3~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan3~13_cout\ = CARRY((\C1|VPOS\(6) & (\C1|Add1~8_combout\ & !\C1|LessThan3~11_cout\)) # (!\C1|VPOS\(6) & ((\C1|Add1~8_combout\) # (!\C1|LessThan3~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(6),
	datab => \C1|Add1~8_combout\,
	datad => VCC,
	cin => \C1|LessThan3~11_cout\,
	cout => \C1|LessThan3~13_cout\);

-- Location: LCCOMB_X62_Y44_N24
\C1|LessThan3~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan3~15_cout\ = CARRY((\C1|VPOS\(7) & ((!\C1|LessThan3~13_cout\) # (!\C1|Add1~10_combout\))) # (!\C1|VPOS\(7) & (!\C1|Add1~10_combout\ & !\C1|LessThan3~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(7),
	datab => \C1|Add1~10_combout\,
	datad => VCC,
	cin => \C1|LessThan3~13_cout\,
	cout => \C1|LessThan3~15_cout\);

-- Location: LCCOMB_X62_Y44_N26
\C1|LessThan3~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan3~17_cout\ = CARRY((\C1|Add1~12_combout\ & ((!\C1|LessThan3~15_cout\) # (!\C1|VPOS\(8)))) # (!\C1|Add1~12_combout\ & (!\C1|VPOS\(8) & !\C1|LessThan3~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add1~12_combout\,
	datab => \C1|VPOS\(8),
	datad => VCC,
	cin => \C1|LessThan3~15_cout\,
	cout => \C1|LessThan3~17_cout\);

-- Location: LCCOMB_X62_Y44_N28
\C1|LessThan3~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan3~19_cout\ = CARRY((\C1|VPOS\(9) & ((!\C1|LessThan3~17_cout\) # (!\C1|Add1~14_combout\))) # (!\C1|VPOS\(9) & (!\C1|Add1~14_combout\ & !\C1|LessThan3~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(9),
	datab => \C1|Add1~14_combout\,
	datad => VCC,
	cin => \C1|LessThan3~17_cout\,
	cout => \C1|LessThan3~19_cout\);

-- Location: LCCOMB_X62_Y44_N30
\C1|LessThan3~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan3~20_combout\ = (\C1|VPOS\(10) & (!\C1|LessThan3~19_cout\ & \C1|Add1~16_combout\)) # (!\C1|VPOS\(10) & ((\C1|Add1~16_combout\) # (!\C1|LessThan3~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(10),
	datad => \C1|Add1~16_combout\,
	cin => \C1|LessThan3~19_cout\,
	combout => \C1|LessThan3~20_combout\);

-- Location: LCCOMB_X59_Y44_N6
\C1|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan1~1_cout\ = CARRY((\C1|SQ_X1\(0) & !\C1|HPOS\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X1\(0),
	datab => \C1|HPOS\(0),
	datad => VCC,
	cout => \C1|LessThan1~1_cout\);

-- Location: LCCOMB_X59_Y44_N8
\C1|LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan1~3_cout\ = CARRY((\C1|HPOS\(1) & ((!\C1|LessThan1~1_cout\) # (!\C1|SQ_X1\(1)))) # (!\C1|HPOS\(1) & (!\C1|SQ_X1\(1) & !\C1|LessThan1~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(1),
	datab => \C1|SQ_X1\(1),
	datad => VCC,
	cin => \C1|LessThan1~1_cout\,
	cout => \C1|LessThan1~3_cout\);

-- Location: LCCOMB_X59_Y44_N10
\C1|LessThan1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan1~5_cout\ = CARRY((\C1|HPOS\(2) & (!\C1|SQ_X1\(2) & !\C1|LessThan1~3_cout\)) # (!\C1|HPOS\(2) & ((!\C1|LessThan1~3_cout\) # (!\C1|SQ_X1\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(2),
	datab => \C1|SQ_X1\(2),
	datad => VCC,
	cin => \C1|LessThan1~3_cout\,
	cout => \C1|LessThan1~5_cout\);

-- Location: LCCOMB_X59_Y44_N12
\C1|LessThan1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan1~7_cout\ = CARRY((\C1|HPOS\(3) & ((!\C1|LessThan1~5_cout\) # (!\C1|Add0~0_combout\))) # (!\C1|HPOS\(3) & (!\C1|Add0~0_combout\ & !\C1|LessThan1~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(3),
	datab => \C1|Add0~0_combout\,
	datad => VCC,
	cin => \C1|LessThan1~5_cout\,
	cout => \C1|LessThan1~7_cout\);

-- Location: LCCOMB_X59_Y44_N14
\C1|LessThan1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan1~9_cout\ = CARRY((\C1|HPOS\(4) & (\C1|Add0~2_combout\ & !\C1|LessThan1~7_cout\)) # (!\C1|HPOS\(4) & ((\C1|Add0~2_combout\) # (!\C1|LessThan1~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(4),
	datab => \C1|Add0~2_combout\,
	datad => VCC,
	cin => \C1|LessThan1~7_cout\,
	cout => \C1|LessThan1~9_cout\);

-- Location: LCCOMB_X59_Y44_N16
\C1|LessThan1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan1~11_cout\ = CARRY((\C1|HPOS\(5) & ((!\C1|LessThan1~9_cout\) # (!\C1|Add0~4_combout\))) # (!\C1|HPOS\(5) & (!\C1|Add0~4_combout\ & !\C1|LessThan1~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(5),
	datab => \C1|Add0~4_combout\,
	datad => VCC,
	cin => \C1|LessThan1~9_cout\,
	cout => \C1|LessThan1~11_cout\);

-- Location: LCCOMB_X59_Y44_N18
\C1|LessThan1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan1~13_cout\ = CARRY((\C1|Add0~6_combout\ & ((!\C1|LessThan1~11_cout\) # (!\C1|HPOS\(6)))) # (!\C1|Add0~6_combout\ & (!\C1|HPOS\(6) & !\C1|LessThan1~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add0~6_combout\,
	datab => \C1|HPOS\(6),
	datad => VCC,
	cin => \C1|LessThan1~11_cout\,
	cout => \C1|LessThan1~13_cout\);

-- Location: LCCOMB_X59_Y44_N20
\C1|LessThan1~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan1~15_cout\ = CARRY((\C1|Add0~8_combout\ & (\C1|HPOS\(7) & !\C1|LessThan1~13_cout\)) # (!\C1|Add0~8_combout\ & ((\C1|HPOS\(7)) # (!\C1|LessThan1~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add0~8_combout\,
	datab => \C1|HPOS\(7),
	datad => VCC,
	cin => \C1|LessThan1~13_cout\,
	cout => \C1|LessThan1~15_cout\);

-- Location: LCCOMB_X59_Y44_N22
\C1|LessThan1~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan1~17_cout\ = CARRY((\C1|HPOS\(8) & (\C1|Add0~10_combout\ & !\C1|LessThan1~15_cout\)) # (!\C1|HPOS\(8) & ((\C1|Add0~10_combout\) # (!\C1|LessThan1~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(8),
	datab => \C1|Add0~10_combout\,
	datad => VCC,
	cin => \C1|LessThan1~15_cout\,
	cout => \C1|LessThan1~17_cout\);

-- Location: LCCOMB_X59_Y44_N24
\C1|LessThan1~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan1~19_cout\ = CARRY((\C1|HPOS\(9) & ((!\C1|LessThan1~17_cout\) # (!\C1|Add0~12_combout\))) # (!\C1|HPOS\(9) & (!\C1|Add0~12_combout\ & !\C1|LessThan1~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(9),
	datab => \C1|Add0~12_combout\,
	datad => VCC,
	cin => \C1|LessThan1~17_cout\,
	cout => \C1|LessThan1~19_cout\);

-- Location: LCCOMB_X59_Y44_N26
\C1|LessThan1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan1~20_combout\ = (\C1|HPOS\(10) & (!\C1|LessThan1~19_cout\ & \C1|Add0~14_combout\)) # (!\C1|HPOS\(10) & ((\C1|Add0~14_combout\) # (!\C1|LessThan1~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(10),
	datad => \C1|Add0~14_combout\,
	cin => \C1|LessThan1~19_cout\,
	combout => \C1|LessThan1~20_combout\);

-- Location: LCCOMB_X61_Y44_N6
\C1|DRAW1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|DRAW1~0_combout\ = (\C1|Add1~18_combout\ & ((\C1|Add0~16_combout\) # ((\C1|LessThan1~20_combout\)))) # (!\C1|Add1~18_combout\ & (\C1|LessThan3~20_combout\ & ((\C1|Add0~16_combout\) # (\C1|LessThan1~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|Add1~18_combout\,
	datab => \C1|Add0~16_combout\,
	datac => \C1|LessThan3~20_combout\,
	datad => \C1|LessThan1~20_combout\,
	combout => \C1|DRAW1~0_combout\);

-- Location: LCCOMB_X61_Y44_N24
\C1|DRAW1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|DRAW1~1_combout\ = (\C1|LessThan2~20_combout\ & (\C1|LessThan0~20_combout\ & \C1|DRAW1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|LessThan2~20_combout\,
	datac => \C1|LessThan0~20_combout\,
	datad => \C1|DRAW1~0_combout\,
	combout => \C1|DRAW1~1_combout\);

-- Location: LCCOMB_X61_Y42_N10
\C1|LessThan10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan10~1_cout\ = CARRY((!\C1|SQ_Y3\(0) & \C1|VPOS\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y3\(0),
	datab => \C1|VPOS\(0),
	datad => VCC,
	cout => \C1|LessThan10~1_cout\);

-- Location: LCCOMB_X61_Y42_N12
\C1|LessThan10~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan10~3_cout\ = CARRY((\C1|SQ_Y3\(1) & ((!\C1|LessThan10~1_cout\) # (!\C1|VPOS\(1)))) # (!\C1|SQ_Y3\(1) & (!\C1|VPOS\(1) & !\C1|LessThan10~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y3\(1),
	datab => \C1|VPOS\(1),
	datad => VCC,
	cin => \C1|LessThan10~1_cout\,
	cout => \C1|LessThan10~3_cout\);

-- Location: LCCOMB_X61_Y42_N14
\C1|LessThan10~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan10~5_cout\ = CARRY((\C1|VPOS\(2) & ((\C1|SQ_Y3\(2)) # (!\C1|LessThan10~3_cout\))) # (!\C1|VPOS\(2) & (\C1|SQ_Y3\(2) & !\C1|LessThan10~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(2),
	datab => \C1|SQ_Y3\(2),
	datad => VCC,
	cin => \C1|LessThan10~3_cout\,
	cout => \C1|LessThan10~5_cout\);

-- Location: LCCOMB_X61_Y42_N16
\C1|LessThan10~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan10~7_cout\ = CARRY((\C1|VPOS\(3) & (!\C1|SQ_Y3\(3) & !\C1|LessThan10~5_cout\)) # (!\C1|VPOS\(3) & ((!\C1|LessThan10~5_cout\) # (!\C1|SQ_Y3\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(3),
	datab => \C1|SQ_Y3\(3),
	datad => VCC,
	cin => \C1|LessThan10~5_cout\,
	cout => \C1|LessThan10~7_cout\);

-- Location: LCCOMB_X61_Y42_N18
\C1|LessThan10~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan10~9_cout\ = CARRY((\C1|SQ_Y3\(4) & ((\C1|VPOS\(4)) # (!\C1|LessThan10~7_cout\))) # (!\C1|SQ_Y3\(4) & (\C1|VPOS\(4) & !\C1|LessThan10~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y3\(4),
	datab => \C1|VPOS\(4),
	datad => VCC,
	cin => \C1|LessThan10~7_cout\,
	cout => \C1|LessThan10~9_cout\);

-- Location: LCCOMB_X61_Y42_N20
\C1|LessThan10~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan10~11_cout\ = CARRY((\C1|SQ_Y3\(5) & (!\C1|VPOS\(5) & !\C1|LessThan10~9_cout\)) # (!\C1|SQ_Y3\(5) & ((!\C1|LessThan10~9_cout\) # (!\C1|VPOS\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y3\(5),
	datab => \C1|VPOS\(5),
	datad => VCC,
	cin => \C1|LessThan10~9_cout\,
	cout => \C1|LessThan10~11_cout\);

-- Location: LCCOMB_X61_Y42_N22
\C1|LessThan10~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan10~13_cout\ = CARRY((\C1|VPOS\(6) & ((!\C1|LessThan10~11_cout\) # (!\C1|SQ_Y3\(6)))) # (!\C1|VPOS\(6) & (!\C1|SQ_Y3\(6) & !\C1|LessThan10~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(6),
	datab => \C1|SQ_Y3\(6),
	datad => VCC,
	cin => \C1|LessThan10~11_cout\,
	cout => \C1|LessThan10~13_cout\);

-- Location: LCCOMB_X61_Y42_N24
\C1|LessThan10~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan10~15_cout\ = CARRY((\C1|SQ_Y3\(7) & (!\C1|VPOS\(7) & !\C1|LessThan10~13_cout\)) # (!\C1|SQ_Y3\(7) & ((!\C1|LessThan10~13_cout\) # (!\C1|VPOS\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y3\(7),
	datab => \C1|VPOS\(7),
	datad => VCC,
	cin => \C1|LessThan10~13_cout\,
	cout => \C1|LessThan10~15_cout\);

-- Location: LCCOMB_X61_Y42_N26
\C1|LessThan10~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan10~17_cout\ = CARRY((\C1|VPOS\(8) & ((!\C1|LessThan10~15_cout\) # (!\C1|SQ_Y3\(8)))) # (!\C1|VPOS\(8) & (!\C1|SQ_Y3\(8) & !\C1|LessThan10~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(8),
	datab => \C1|SQ_Y3\(8),
	datad => VCC,
	cin => \C1|LessThan10~15_cout\,
	cout => \C1|LessThan10~17_cout\);

-- Location: LCCOMB_X61_Y42_N28
\C1|LessThan10~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan10~19_cout\ = CARRY((\C1|VPOS\(9) & (!\C1|SQ_Y3\(9) & !\C1|LessThan10~17_cout\)) # (!\C1|VPOS\(9) & ((!\C1|LessThan10~17_cout\) # (!\C1|SQ_Y3\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(9),
	datab => \C1|SQ_Y3\(9),
	datad => VCC,
	cin => \C1|LessThan10~17_cout\,
	cout => \C1|LessThan10~19_cout\);

-- Location: LCCOMB_X61_Y42_N30
\C1|LessThan10~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan10~20_combout\ = (\C1|VPOS\(10) & ((!\C1|SQ_Y3\(10)) # (!\C1|LessThan10~19_cout\))) # (!\C1|VPOS\(10) & (!\C1|LessThan10~19_cout\ & !\C1|SQ_Y3\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(10),
	datad => \C1|SQ_Y3\(10),
	cin => \C1|LessThan10~19_cout\,
	combout => \C1|LessThan10~20_combout\);

-- Location: LCCOMB_X61_Y44_N4
\C1|DRAW3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|DRAW3~1_combout\ = (\C1|LessThan8~20_combout\ & (\C1|LessThan10~20_combout\ & \C1|DRAW3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C1|LessThan8~20_combout\,
	datac => \C1|LessThan10~20_combout\,
	datad => \C1|DRAW3~0_combout\,
	combout => \C1|DRAW3~1_combout\);

-- Location: LCCOMB_X69_Y45_N10
\C1|Add12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add12~1_combout\ = \C1|SQ_X2\(0) $ (VCC)
-- \C1|Add12~2\ = CARRY(\C1|SQ_X2\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X2\(0),
	datad => VCC,
	combout => \C1|Add12~1_combout\,
	cout => \C1|Add12~2\);

-- Location: LCCOMB_X69_Y45_N12
\C1|Add12~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add12~3_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X2\(1) & (!\C1|Add12~2\)) # (!\C1|SQ_X2\(1) & ((\C1|Add12~2\) # (GND))))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X2\(1) & (\C1|Add12~2\ & VCC)) # (!\C1|SQ_X2\(1) & (!\C1|Add12~2\))))
-- \C1|Add12~4\ = CARRY((\KEY[1]~input_o\ & ((!\C1|Add12~2\) # (!\C1|SQ_X2\(1)))) # (!\KEY[1]~input_o\ & (!\C1|SQ_X2\(1) & !\C1|Add12~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X2\(1),
	datad => VCC,
	cin => \C1|Add12~2\,
	combout => \C1|Add12~3_combout\,
	cout => \C1|Add12~4\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: LCCOMB_X68_Y45_N22
\C1|SQ_X2[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X2[10]~0_combout\ = (\C1|SQ_X3[10]~0_combout\ & \SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|SQ_X3[10]~0_combout\,
	datad => \SW[1]~input_o\,
	combout => \C1|SQ_X2[10]~0_combout\);

-- Location: FF_X69_Y45_N13
\C1|SQ_X2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add12~3_combout\,
	ena => \C1|SQ_X2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X2\(1));

-- Location: LCCOMB_X69_Y45_N14
\C1|Add12~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add12~5_combout\ = ((\KEY[1]~input_o\ $ (\C1|SQ_X2\(2) $ (\C1|Add12~4\)))) # (GND)
-- \C1|Add12~6\ = CARRY((\KEY[1]~input_o\ & ((!\C1|Add12~4\) # (!\C1|SQ_X2\(2)))) # (!\KEY[1]~input_o\ & (!\C1|SQ_X2\(2) & !\C1|Add12~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X2\(2),
	datad => VCC,
	cin => \C1|Add12~4\,
	combout => \C1|Add12~5_combout\,
	cout => \C1|Add12~6\);

-- Location: LCCOMB_X68_Y45_N20
\C1|SQ_X2[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X2[2]~6_combout\ = !\C1|Add12~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|Add12~5_combout\,
	combout => \C1|SQ_X2[2]~6_combout\);

-- Location: FF_X68_Y45_N21
\C1|SQ_X2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X2[2]~6_combout\,
	ena => \C1|SQ_X2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X2\(2));

-- Location: LCCOMB_X69_Y45_N16
\C1|Add12~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add12~7_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X2\(3) & (!\C1|Add12~6\)) # (!\C1|SQ_X2\(3) & ((\C1|Add12~6\) # (GND))))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X2\(3) & (\C1|Add12~6\ & VCC)) # (!\C1|SQ_X2\(3) & (!\C1|Add12~6\))))
-- \C1|Add12~8\ = CARRY((\KEY[1]~input_o\ & ((!\C1|Add12~6\) # (!\C1|SQ_X2\(3)))) # (!\KEY[1]~input_o\ & (!\C1|SQ_X2\(3) & !\C1|Add12~6\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X2\(3),
	datad => VCC,
	cin => \C1|Add12~6\,
	combout => \C1|Add12~7_combout\,
	cout => \C1|Add12~8\);

-- Location: FF_X69_Y45_N17
\C1|SQ_X2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add12~7_combout\,
	ena => \C1|SQ_X2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X2\(3));

-- Location: LCCOMB_X69_Y45_N18
\C1|Add12~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add12~9_combout\ = ((\KEY[1]~input_o\ $ (\C1|SQ_X2\(4) $ (!\C1|Add12~8\)))) # (GND)
-- \C1|Add12~10\ = CARRY((\KEY[1]~input_o\ & (!\C1|SQ_X2\(4) & !\C1|Add12~8\)) # (!\KEY[1]~input_o\ & ((!\C1|Add12~8\) # (!\C1|SQ_X2\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X2\(4),
	datad => VCC,
	cin => \C1|Add12~8\,
	combout => \C1|Add12~9_combout\,
	cout => \C1|Add12~10\);

-- Location: LCCOMB_X68_Y45_N26
\C1|SQ_X2[4]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X2[4]~5_combout\ = !\C1|Add12~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add12~9_combout\,
	combout => \C1|SQ_X2[4]~5_combout\);

-- Location: FF_X68_Y45_N27
\C1|SQ_X2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X2[4]~5_combout\,
	ena => \C1|SQ_X2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X2\(4));

-- Location: LCCOMB_X69_Y45_N20
\C1|Add12~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add12~11_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X2\(5) & ((\C1|Add12~10\) # (GND))) # (!\C1|SQ_X2\(5) & (!\C1|Add12~10\)))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X2\(5) & (!\C1|Add12~10\)) # (!\C1|SQ_X2\(5) & (\C1|Add12~10\ & VCC))))
-- \C1|Add12~12\ = CARRY((\KEY[1]~input_o\ & ((\C1|SQ_X2\(5)) # (!\C1|Add12~10\))) # (!\KEY[1]~input_o\ & (\C1|SQ_X2\(5) & !\C1|Add12~10\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X2\(5),
	datad => VCC,
	cin => \C1|Add12~10\,
	combout => \C1|Add12~11_combout\,
	cout => \C1|Add12~12\);

-- Location: LCCOMB_X68_Y45_N24
\C1|SQ_X2[5]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X2[5]~4_combout\ = !\C1|Add12~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|Add12~11_combout\,
	combout => \C1|SQ_X2[5]~4_combout\);

-- Location: FF_X68_Y45_N25
\C1|SQ_X2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X2[5]~4_combout\,
	ena => \C1|SQ_X2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X2\(5));

-- Location: LCCOMB_X69_Y45_N22
\C1|Add12~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add12~13_combout\ = ((\KEY[1]~input_o\ $ (\C1|SQ_X2\(6) $ (!\C1|Add12~12\)))) # (GND)
-- \C1|Add12~14\ = CARRY((\KEY[1]~input_o\ & (!\C1|SQ_X2\(6) & !\C1|Add12~12\)) # (!\KEY[1]~input_o\ & ((!\C1|Add12~12\) # (!\C1|SQ_X2\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X2\(6),
	datad => VCC,
	cin => \C1|Add12~12\,
	combout => \C1|Add12~13_combout\,
	cout => \C1|Add12~14\);

-- Location: LCCOMB_X68_Y45_N30
\C1|SQ_X2[6]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X2[6]~3_combout\ = !\C1|Add12~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add12~13_combout\,
	combout => \C1|SQ_X2[6]~3_combout\);

-- Location: FF_X68_Y45_N31
\C1|SQ_X2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X2[6]~3_combout\,
	ena => \C1|SQ_X2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X2\(6));

-- Location: LCCOMB_X69_Y45_N24
\C1|Add12~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add12~15_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X2\(7) & ((\C1|Add12~14\) # (GND))) # (!\C1|SQ_X2\(7) & (!\C1|Add12~14\)))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X2\(7) & (!\C1|Add12~14\)) # (!\C1|SQ_X2\(7) & (\C1|Add12~14\ & VCC))))
-- \C1|Add12~16\ = CARRY((\KEY[1]~input_o\ & ((\C1|SQ_X2\(7)) # (!\C1|Add12~14\))) # (!\KEY[1]~input_o\ & (\C1|SQ_X2\(7) & !\C1|Add12~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X2\(7),
	datad => VCC,
	cin => \C1|Add12~14\,
	combout => \C1|Add12~15_combout\,
	cout => \C1|Add12~16\);

-- Location: LCCOMB_X68_Y45_N28
\C1|SQ_X2[7]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X2[7]~2_combout\ = !\C1|Add12~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add12~15_combout\,
	combout => \C1|SQ_X2[7]~2_combout\);

-- Location: FF_X68_Y45_N29
\C1|SQ_X2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X2[7]~2_combout\,
	ena => \C1|SQ_X2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X2\(7));

-- Location: LCCOMB_X69_Y45_N26
\C1|Add12~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add12~17_combout\ = ((\KEY[1]~input_o\ $ (\C1|SQ_X2\(8) $ (!\C1|Add12~16\)))) # (GND)
-- \C1|Add12~18\ = CARRY((\KEY[1]~input_o\ & (!\C1|SQ_X2\(8) & !\C1|Add12~16\)) # (!\KEY[1]~input_o\ & ((!\C1|Add12~16\) # (!\C1|SQ_X2\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X2\(8),
	datad => VCC,
	cin => \C1|Add12~16\,
	combout => \C1|Add12~17_combout\,
	cout => \C1|Add12~18\);

-- Location: LCCOMB_X68_Y45_N18
\C1|SQ_X2[8]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_X2[8]~1_combout\ = !\C1|Add12~17_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|Add12~17_combout\,
	combout => \C1|SQ_X2[8]~1_combout\);

-- Location: FF_X68_Y45_N19
\C1|SQ_X2[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_X2[8]~1_combout\,
	ena => \C1|SQ_X2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X2\(8));

-- Location: LCCOMB_X69_Y45_N28
\C1|Add12~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add12~19_combout\ = (\KEY[1]~input_o\ & ((\C1|SQ_X2\(9) & (!\C1|Add12~18\)) # (!\C1|SQ_X2\(9) & ((\C1|Add12~18\) # (GND))))) # (!\KEY[1]~input_o\ & ((\C1|SQ_X2\(9) & (\C1|Add12~18\ & VCC)) # (!\C1|SQ_X2\(9) & (!\C1|Add12~18\))))
-- \C1|Add12~20\ = CARRY((\KEY[1]~input_o\ & ((!\C1|Add12~18\) # (!\C1|SQ_X2\(9)))) # (!\KEY[1]~input_o\ & (!\C1|SQ_X2\(9) & !\C1|Add12~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \C1|SQ_X2\(9),
	datad => VCC,
	cin => \C1|Add12~18\,
	combout => \C1|Add12~19_combout\,
	cout => \C1|Add12~20\);

-- Location: FF_X69_Y45_N29
\C1|SQ_X2[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add12~19_combout\,
	ena => \C1|SQ_X2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X2\(9));

-- Location: LCCOMB_X69_Y45_N30
\C1|Add12~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add12~21_combout\ = \KEY[1]~input_o\ $ (\C1|Add12~20\ $ (\C1|SQ_X2\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datad => \C1|SQ_X2\(10),
	cin => \C1|Add12~20\,
	combout => \C1|Add12~21_combout\);

-- Location: FF_X69_Y45_N31
\C1|SQ_X2[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add12~21_combout\,
	ena => \C1|SQ_X2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X2\(10));

-- Location: FF_X69_Y45_N11
\C1|SQ_X2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add12~1_combout\,
	ena => \C1|SQ_X2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_X2\(0));

-- Location: LCCOMB_X66_Y45_N0
\C1|LessThan4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan4~1_cout\ = CARRY((\C1|HPOS\(0) & !\C1|SQ_X2\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(0),
	datab => \C1|SQ_X2\(0),
	datad => VCC,
	cout => \C1|LessThan4~1_cout\);

-- Location: LCCOMB_X66_Y45_N2
\C1|LessThan4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan4~3_cout\ = CARRY((\C1|HPOS\(1) & (\C1|SQ_X2\(1) & !\C1|LessThan4~1_cout\)) # (!\C1|HPOS\(1) & ((\C1|SQ_X2\(1)) # (!\C1|LessThan4~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(1),
	datab => \C1|SQ_X2\(1),
	datad => VCC,
	cin => \C1|LessThan4~1_cout\,
	cout => \C1|LessThan4~3_cout\);

-- Location: LCCOMB_X66_Y45_N4
\C1|LessThan4~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan4~5_cout\ = CARRY((\C1|HPOS\(2) & ((\C1|SQ_X2\(2)) # (!\C1|LessThan4~3_cout\))) # (!\C1|HPOS\(2) & (\C1|SQ_X2\(2) & !\C1|LessThan4~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(2),
	datab => \C1|SQ_X2\(2),
	datad => VCC,
	cin => \C1|LessThan4~3_cout\,
	cout => \C1|LessThan4~5_cout\);

-- Location: LCCOMB_X66_Y45_N6
\C1|LessThan4~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan4~7_cout\ = CARRY((\C1|HPOS\(3) & (\C1|SQ_X2\(3) & !\C1|LessThan4~5_cout\)) # (!\C1|HPOS\(3) & ((\C1|SQ_X2\(3)) # (!\C1|LessThan4~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(3),
	datab => \C1|SQ_X2\(3),
	datad => VCC,
	cin => \C1|LessThan4~5_cout\,
	cout => \C1|LessThan4~7_cout\);

-- Location: LCCOMB_X66_Y45_N8
\C1|LessThan4~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan4~9_cout\ = CARRY((\C1|HPOS\(4) & ((\C1|SQ_X2\(4)) # (!\C1|LessThan4~7_cout\))) # (!\C1|HPOS\(4) & (\C1|SQ_X2\(4) & !\C1|LessThan4~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(4),
	datab => \C1|SQ_X2\(4),
	datad => VCC,
	cin => \C1|LessThan4~7_cout\,
	cout => \C1|LessThan4~9_cout\);

-- Location: LCCOMB_X66_Y45_N10
\C1|LessThan4~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan4~11_cout\ = CARRY((\C1|SQ_X2\(5) & (!\C1|HPOS\(5) & !\C1|LessThan4~9_cout\)) # (!\C1|SQ_X2\(5) & ((!\C1|LessThan4~9_cout\) # (!\C1|HPOS\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X2\(5),
	datab => \C1|HPOS\(5),
	datad => VCC,
	cin => \C1|LessThan4~9_cout\,
	cout => \C1|LessThan4~11_cout\);

-- Location: LCCOMB_X66_Y45_N12
\C1|LessThan4~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan4~13_cout\ = CARRY((\C1|HPOS\(6) & ((\C1|SQ_X2\(6)) # (!\C1|LessThan4~11_cout\))) # (!\C1|HPOS\(6) & (\C1|SQ_X2\(6) & !\C1|LessThan4~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(6),
	datab => \C1|SQ_X2\(6),
	datad => VCC,
	cin => \C1|LessThan4~11_cout\,
	cout => \C1|LessThan4~13_cout\);

-- Location: LCCOMB_X66_Y45_N14
\C1|LessThan4~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan4~15_cout\ = CARRY((\C1|HPOS\(7) & (!\C1|SQ_X2\(7) & !\C1|LessThan4~13_cout\)) # (!\C1|HPOS\(7) & ((!\C1|LessThan4~13_cout\) # (!\C1|SQ_X2\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|HPOS\(7),
	datab => \C1|SQ_X2\(7),
	datad => VCC,
	cin => \C1|LessThan4~13_cout\,
	cout => \C1|LessThan4~15_cout\);

-- Location: LCCOMB_X66_Y45_N16
\C1|LessThan4~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan4~17_cout\ = CARRY((\C1|SQ_X2\(8) & ((\C1|HPOS\(8)) # (!\C1|LessThan4~15_cout\))) # (!\C1|SQ_X2\(8) & (\C1|HPOS\(8) & !\C1|LessThan4~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X2\(8),
	datab => \C1|HPOS\(8),
	datad => VCC,
	cin => \C1|LessThan4~15_cout\,
	cout => \C1|LessThan4~17_cout\);

-- Location: LCCOMB_X66_Y45_N18
\C1|LessThan4~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan4~19_cout\ = CARRY((\C1|SQ_X2\(9) & ((!\C1|LessThan4~17_cout\) # (!\C1|HPOS\(9)))) # (!\C1|SQ_X2\(9) & (!\C1|HPOS\(9) & !\C1|LessThan4~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_X2\(9),
	datab => \C1|HPOS\(9),
	datad => VCC,
	cin => \C1|LessThan4~17_cout\,
	cout => \C1|LessThan4~19_cout\);

-- Location: LCCOMB_X66_Y45_N20
\C1|LessThan4~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan4~20_combout\ = (\C1|HPOS\(10) & ((!\C1|SQ_X2\(10)) # (!\C1|LessThan4~19_cout\))) # (!\C1|HPOS\(10) & (!\C1|LessThan4~19_cout\ & !\C1|SQ_X2\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|HPOS\(10),
	datad => \C1|SQ_X2\(10),
	cin => \C1|LessThan4~19_cout\,
	combout => \C1|LessThan4~20_combout\);

-- Location: LCCOMB_X66_Y44_N6
\C1|Add14~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add14~1_combout\ = \C1|SQ_Y2\(0) $ (VCC)
-- \C1|Add14~2\ = CARRY(\C1|SQ_Y2\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y2\(0),
	datad => VCC,
	combout => \C1|Add14~1_combout\,
	cout => \C1|Add14~2\);

-- Location: LCCOMB_X66_Y44_N8
\C1|Add14~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add14~3_combout\ = (\KEY[3]~input_o\ & ((\C1|SQ_Y2\(1) & (!\C1|Add14~2\)) # (!\C1|SQ_Y2\(1) & ((\C1|Add14~2\) # (GND))))) # (!\KEY[3]~input_o\ & ((\C1|SQ_Y2\(1) & (\C1|Add14~2\ & VCC)) # (!\C1|SQ_Y2\(1) & (!\C1|Add14~2\))))
-- \C1|Add14~4\ = CARRY((\KEY[3]~input_o\ & ((!\C1|Add14~2\) # (!\C1|SQ_Y2\(1)))) # (!\KEY[3]~input_o\ & (!\C1|SQ_Y2\(1) & !\C1|Add14~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y2\(1),
	datad => VCC,
	cin => \C1|Add14~2\,
	combout => \C1|Add14~3_combout\,
	cout => \C1|Add14~4\);

-- Location: LCCOMB_X66_Y44_N28
\C1|SQ_Y2[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y2[10]~0_combout\ = (\C1|SQ_Y3[10]~0_combout\ & \SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C1|SQ_Y3[10]~0_combout\,
	datad => \SW[1]~input_o\,
	combout => \C1|SQ_Y2[10]~0_combout\);

-- Location: FF_X66_Y44_N9
\C1|SQ_Y2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add14~3_combout\,
	ena => \C1|SQ_Y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y2\(1));

-- Location: LCCOMB_X66_Y44_N10
\C1|Add14~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add14~5_combout\ = ((\KEY[3]~input_o\ $ (\C1|SQ_Y2\(2) $ (\C1|Add14~4\)))) # (GND)
-- \C1|Add14~6\ = CARRY((\KEY[3]~input_o\ & ((!\C1|Add14~4\) # (!\C1|SQ_Y2\(2)))) # (!\KEY[3]~input_o\ & (!\C1|SQ_Y2\(2) & !\C1|Add14~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y2\(2),
	datad => VCC,
	cin => \C1|Add14~4\,
	combout => \C1|Add14~5_combout\,
	cout => \C1|Add14~6\);

-- Location: LCCOMB_X67_Y44_N30
\C1|SQ_Y2[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y2[2]~6_combout\ = !\C1|Add14~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add14~5_combout\,
	combout => \C1|SQ_Y2[2]~6_combout\);

-- Location: FF_X67_Y44_N31
\C1|SQ_Y2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y2[2]~6_combout\,
	ena => \C1|SQ_Y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y2\(2));

-- Location: LCCOMB_X66_Y44_N12
\C1|Add14~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add14~7_combout\ = (\KEY[3]~input_o\ & ((\C1|SQ_Y2\(3) & (!\C1|Add14~6\)) # (!\C1|SQ_Y2\(3) & ((\C1|Add14~6\) # (GND))))) # (!\KEY[3]~input_o\ & ((\C1|SQ_Y2\(3) & (\C1|Add14~6\ & VCC)) # (!\C1|SQ_Y2\(3) & (!\C1|Add14~6\))))
-- \C1|Add14~8\ = CARRY((\KEY[3]~input_o\ & ((!\C1|Add14~6\) # (!\C1|SQ_Y2\(3)))) # (!\KEY[3]~input_o\ & (!\C1|SQ_Y2\(3) & !\C1|Add14~6\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y2\(3),
	datad => VCC,
	cin => \C1|Add14~6\,
	combout => \C1|Add14~7_combout\,
	cout => \C1|Add14~8\);

-- Location: FF_X66_Y44_N13
\C1|SQ_Y2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add14~7_combout\,
	ena => \C1|SQ_Y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y2\(3));

-- Location: LCCOMB_X66_Y44_N14
\C1|Add14~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add14~9_combout\ = ((\KEY[3]~input_o\ $ (\C1|SQ_Y2\(4) $ (!\C1|Add14~8\)))) # (GND)
-- \C1|Add14~10\ = CARRY((\KEY[3]~input_o\ & (!\C1|SQ_Y2\(4) & !\C1|Add14~8\)) # (!\KEY[3]~input_o\ & ((!\C1|Add14~8\) # (!\C1|SQ_Y2\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y2\(4),
	datad => VCC,
	cin => \C1|Add14~8\,
	combout => \C1|Add14~9_combout\,
	cout => \C1|Add14~10\);

-- Location: LCCOMB_X67_Y44_N8
\C1|SQ_Y2[4]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y2[4]~5_combout\ = !\C1|Add14~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add14~9_combout\,
	combout => \C1|SQ_Y2[4]~5_combout\);

-- Location: FF_X67_Y44_N9
\C1|SQ_Y2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y2[4]~5_combout\,
	ena => \C1|SQ_Y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y2\(4));

-- Location: LCCOMB_X66_Y44_N16
\C1|Add14~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add14~11_combout\ = (\KEY[3]~input_o\ & ((\C1|SQ_Y2\(5) & ((\C1|Add14~10\) # (GND))) # (!\C1|SQ_Y2\(5) & (!\C1|Add14~10\)))) # (!\KEY[3]~input_o\ & ((\C1|SQ_Y2\(5) & (!\C1|Add14~10\)) # (!\C1|SQ_Y2\(5) & (\C1|Add14~10\ & VCC))))
-- \C1|Add14~12\ = CARRY((\KEY[3]~input_o\ & ((\C1|SQ_Y2\(5)) # (!\C1|Add14~10\))) # (!\KEY[3]~input_o\ & (\C1|SQ_Y2\(5) & !\C1|Add14~10\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y2\(5),
	datad => VCC,
	cin => \C1|Add14~10\,
	combout => \C1|Add14~11_combout\,
	cout => \C1|Add14~12\);

-- Location: LCCOMB_X67_Y44_N6
\C1|SQ_Y2[5]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y2[5]~4_combout\ = !\C1|Add14~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C1|Add14~11_combout\,
	combout => \C1|SQ_Y2[5]~4_combout\);

-- Location: FF_X67_Y44_N7
\C1|SQ_Y2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y2[5]~4_combout\,
	ena => \C1|SQ_Y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y2\(5));

-- Location: LCCOMB_X66_Y44_N18
\C1|Add14~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add14~13_combout\ = ((\KEY[3]~input_o\ $ (\C1|SQ_Y2\(6) $ (!\C1|Add14~12\)))) # (GND)
-- \C1|Add14~14\ = CARRY((\KEY[3]~input_o\ & (!\C1|SQ_Y2\(6) & !\C1|Add14~12\)) # (!\KEY[3]~input_o\ & ((!\C1|Add14~12\) # (!\C1|SQ_Y2\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y2\(6),
	datad => VCC,
	cin => \C1|Add14~12\,
	combout => \C1|Add14~13_combout\,
	cout => \C1|Add14~14\);

-- Location: LCCOMB_X67_Y44_N4
\C1|SQ_Y2[6]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y2[6]~3_combout\ = !\C1|Add14~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add14~13_combout\,
	combout => \C1|SQ_Y2[6]~3_combout\);

-- Location: FF_X67_Y44_N5
\C1|SQ_Y2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y2[6]~3_combout\,
	ena => \C1|SQ_Y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y2\(6));

-- Location: LCCOMB_X66_Y44_N20
\C1|Add14~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add14~15_combout\ = (\KEY[3]~input_o\ & ((\C1|SQ_Y2\(7) & ((\C1|Add14~14\) # (GND))) # (!\C1|SQ_Y2\(7) & (!\C1|Add14~14\)))) # (!\KEY[3]~input_o\ & ((\C1|SQ_Y2\(7) & (!\C1|Add14~14\)) # (!\C1|SQ_Y2\(7) & (\C1|Add14~14\ & VCC))))
-- \C1|Add14~16\ = CARRY((\KEY[3]~input_o\ & ((\C1|SQ_Y2\(7)) # (!\C1|Add14~14\))) # (!\KEY[3]~input_o\ & (\C1|SQ_Y2\(7) & !\C1|Add14~14\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y2\(7),
	datad => VCC,
	cin => \C1|Add14~14\,
	combout => \C1|Add14~15_combout\,
	cout => \C1|Add14~16\);

-- Location: LCCOMB_X67_Y44_N2
\C1|SQ_Y2[7]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y2[7]~2_combout\ = !\C1|Add14~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add14~15_combout\,
	combout => \C1|SQ_Y2[7]~2_combout\);

-- Location: FF_X67_Y44_N3
\C1|SQ_Y2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y2[7]~2_combout\,
	ena => \C1|SQ_Y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y2\(7));

-- Location: LCCOMB_X66_Y44_N22
\C1|Add14~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add14~17_combout\ = ((\KEY[3]~input_o\ $ (\C1|SQ_Y2\(8) $ (!\C1|Add14~16\)))) # (GND)
-- \C1|Add14~18\ = CARRY((\KEY[3]~input_o\ & (!\C1|SQ_Y2\(8) & !\C1|Add14~16\)) # (!\KEY[3]~input_o\ & ((!\C1|Add14~16\) # (!\C1|SQ_Y2\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y2\(8),
	datad => VCC,
	cin => \C1|Add14~16\,
	combout => \C1|Add14~17_combout\,
	cout => \C1|Add14~18\);

-- Location: LCCOMB_X67_Y44_N0
\C1|SQ_Y2[8]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|SQ_Y2[8]~1_combout\ = !\C1|Add14~17_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \C1|Add14~17_combout\,
	combout => \C1|SQ_Y2[8]~1_combout\);

-- Location: FF_X67_Y44_N1
\C1|SQ_Y2[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|SQ_Y2[8]~1_combout\,
	ena => \C1|SQ_Y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y2\(8));

-- Location: LCCOMB_X66_Y44_N24
\C1|Add14~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add14~19_combout\ = (\KEY[3]~input_o\ & ((\C1|SQ_Y2\(9) & (!\C1|Add14~18\)) # (!\C1|SQ_Y2\(9) & ((\C1|Add14~18\) # (GND))))) # (!\KEY[3]~input_o\ & ((\C1|SQ_Y2\(9) & (\C1|Add14~18\ & VCC)) # (!\C1|SQ_Y2\(9) & (!\C1|Add14~18\))))
-- \C1|Add14~20\ = CARRY((\KEY[3]~input_o\ & ((!\C1|Add14~18\) # (!\C1|SQ_Y2\(9)))) # (!\KEY[3]~input_o\ & (!\C1|SQ_Y2\(9) & !\C1|Add14~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[3]~input_o\,
	datab => \C1|SQ_Y2\(9),
	datad => VCC,
	cin => \C1|Add14~18\,
	combout => \C1|Add14~19_combout\,
	cout => \C1|Add14~20\);

-- Location: FF_X66_Y44_N25
\C1|SQ_Y2[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add14~19_combout\,
	ena => \C1|SQ_Y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y2\(9));

-- Location: LCCOMB_X66_Y44_N26
\C1|Add14~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|Add14~21_combout\ = \C1|SQ_Y2\(10) $ (\C1|Add14~20\ $ (\KEY[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y2\(10),
	datad => \KEY[3]~input_o\,
	cin => \C1|Add14~20\,
	combout => \C1|Add14~21_combout\);

-- Location: FF_X66_Y44_N27
\C1|SQ_Y2[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add14~21_combout\,
	ena => \C1|SQ_Y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y2\(10));

-- Location: FF_X66_Y44_N7
\C1|SQ_Y2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|Add14~1_combout\,
	ena => \C1|SQ_Y2[10]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|SQ_Y2\(0));

-- Location: LCCOMB_X68_Y42_N8
\C1|LessThan6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan6~1_cout\ = CARRY((\C1|VPOS\(0) & !\C1|SQ_Y2\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(0),
	datab => \C1|SQ_Y2\(0),
	datad => VCC,
	cout => \C1|LessThan6~1_cout\);

-- Location: LCCOMB_X68_Y42_N10
\C1|LessThan6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan6~3_cout\ = CARRY((\C1|VPOS\(1) & (\C1|SQ_Y2\(1) & !\C1|LessThan6~1_cout\)) # (!\C1|VPOS\(1) & ((\C1|SQ_Y2\(1)) # (!\C1|LessThan6~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(1),
	datab => \C1|SQ_Y2\(1),
	datad => VCC,
	cin => \C1|LessThan6~1_cout\,
	cout => \C1|LessThan6~3_cout\);

-- Location: LCCOMB_X68_Y42_N12
\C1|LessThan6~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan6~5_cout\ = CARRY((\C1|VPOS\(2) & ((\C1|SQ_Y2\(2)) # (!\C1|LessThan6~3_cout\))) # (!\C1|VPOS\(2) & (\C1|SQ_Y2\(2) & !\C1|LessThan6~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(2),
	datab => \C1|SQ_Y2\(2),
	datad => VCC,
	cin => \C1|LessThan6~3_cout\,
	cout => \C1|LessThan6~5_cout\);

-- Location: LCCOMB_X68_Y42_N14
\C1|LessThan6~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan6~7_cout\ = CARRY((\C1|VPOS\(3) & (\C1|SQ_Y2\(3) & !\C1|LessThan6~5_cout\)) # (!\C1|VPOS\(3) & ((\C1|SQ_Y2\(3)) # (!\C1|LessThan6~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|VPOS\(3),
	datab => \C1|SQ_Y2\(3),
	datad => VCC,
	cin => \C1|LessThan6~5_cout\,
	cout => \C1|LessThan6~7_cout\);

-- Location: LCCOMB_X68_Y42_N16
\C1|LessThan6~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan6~9_cout\ = CARRY((\C1|SQ_Y2\(4) & ((\C1|VPOS\(4)) # (!\C1|LessThan6~7_cout\))) # (!\C1|SQ_Y2\(4) & (\C1|VPOS\(4) & !\C1|LessThan6~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y2\(4),
	datab => \C1|VPOS\(4),
	datad => VCC,
	cin => \C1|LessThan6~7_cout\,
	cout => \C1|LessThan6~9_cout\);

-- Location: LCCOMB_X68_Y42_N18
\C1|LessThan6~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan6~11_cout\ = CARRY((\C1|SQ_Y2\(5) & (!\C1|VPOS\(5) & !\C1|LessThan6~9_cout\)) # (!\C1|SQ_Y2\(5) & ((!\C1|LessThan6~9_cout\) # (!\C1|VPOS\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y2\(5),
	datab => \C1|VPOS\(5),
	datad => VCC,
	cin => \C1|LessThan6~9_cout\,
	cout => \C1|LessThan6~11_cout\);

-- Location: LCCOMB_X68_Y42_N20
\C1|LessThan6~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan6~13_cout\ = CARRY((\C1|SQ_Y2\(6) & ((\C1|VPOS\(6)) # (!\C1|LessThan6~11_cout\))) # (!\C1|SQ_Y2\(6) & (\C1|VPOS\(6) & !\C1|LessThan6~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y2\(6),
	datab => \C1|VPOS\(6),
	datad => VCC,
	cin => \C1|LessThan6~11_cout\,
	cout => \C1|LessThan6~13_cout\);

-- Location: LCCOMB_X68_Y42_N22
\C1|LessThan6~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan6~15_cout\ = CARRY((\C1|SQ_Y2\(7) & (!\C1|VPOS\(7) & !\C1|LessThan6~13_cout\)) # (!\C1|SQ_Y2\(7) & ((!\C1|LessThan6~13_cout\) # (!\C1|VPOS\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y2\(7),
	datab => \C1|VPOS\(7),
	datad => VCC,
	cin => \C1|LessThan6~13_cout\,
	cout => \C1|LessThan6~15_cout\);

-- Location: LCCOMB_X68_Y42_N24
\C1|LessThan6~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan6~17_cout\ = CARRY((\C1|SQ_Y2\(8) & ((\C1|VPOS\(8)) # (!\C1|LessThan6~15_cout\))) # (!\C1|SQ_Y2\(8) & (\C1|VPOS\(8) & !\C1|LessThan6~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y2\(8),
	datab => \C1|VPOS\(8),
	datad => VCC,
	cin => \C1|LessThan6~15_cout\,
	cout => \C1|LessThan6~17_cout\);

-- Location: LCCOMB_X68_Y42_N26
\C1|LessThan6~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan6~19_cout\ = CARRY((\C1|SQ_Y2\(9) & ((!\C1|LessThan6~17_cout\) # (!\C1|VPOS\(9)))) # (!\C1|SQ_Y2\(9) & (!\C1|VPOS\(9) & !\C1|LessThan6~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C1|SQ_Y2\(9),
	datab => \C1|VPOS\(9),
	datad => VCC,
	cin => \C1|LessThan6~17_cout\,
	cout => \C1|LessThan6~19_cout\);

-- Location: LCCOMB_X68_Y42_N28
\C1|LessThan6~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|LessThan6~20_combout\ = (\C1|VPOS\(10) & ((!\C1|SQ_Y2\(10)) # (!\C1|LessThan6~19_cout\))) # (!\C1|VPOS\(10) & (!\C1|LessThan6~19_cout\ & !\C1|SQ_Y2\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C1|VPOS\(10),
	datad => \C1|SQ_Y2\(10),
	cin => \C1|LessThan6~19_cout\,
	combout => \C1|LessThan6~20_combout\);

-- Location: LCCOMB_X61_Y44_N28
\C1|DRAW2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|DRAW2~1_combout\ = (\C1|DRAW2~0_combout\ & (\C1|LessThan4~20_combout\ & \C1|LessThan6~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|DRAW2~0_combout\,
	datac => \C1|LessThan4~20_combout\,
	datad => \C1|LessThan6~20_combout\,
	combout => \C1|DRAW2~1_combout\);

-- Location: LCCOMB_X61_Y44_N14
\C1|B~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|B~1_combout\ = (\C1|B~0_combout\ & (!\C1|DRAW3~1_combout\ & ((\C1|DRAW1~1_combout\) # (\C1|DRAW2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|B~0_combout\,
	datab => \C1|DRAW1~1_combout\,
	datac => \C1|DRAW3~1_combout\,
	datad => \C1|DRAW2~1_combout\,
	combout => \C1|B~1_combout\);

-- Location: LCCOMB_X61_Y44_N0
\C1|R~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|R~1_combout\ = (\C1|R~0_combout\ & ((\C1|B~1_combout\) # ((\C1|B~2_combout\ & !\SW[2]~input_o\)))) # (!\C1|R~0_combout\ & (\C1|B~2_combout\ & ((!\SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|R~0_combout\,
	datab => \C1|B~2_combout\,
	datac => \C1|B~1_combout\,
	datad => \SW[2]~input_o\,
	combout => \C1|R~1_combout\);

-- Location: FF_X61_Y44_N1
\C1|R[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|R~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|R\(0));

-- Location: LCCOMB_X61_Y44_N2
\C1|G~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|G~1_combout\ = (\C1|G~0_combout\ & ((\C1|B~1_combout\) # ((\C1|B~2_combout\ & !\SW[2]~input_o\)))) # (!\C1|G~0_combout\ & (\C1|B~2_combout\ & ((!\SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|G~0_combout\,
	datab => \C1|B~2_combout\,
	datac => \C1|B~1_combout\,
	datad => \SW[2]~input_o\,
	combout => \C1|G~1_combout\);

-- Location: FF_X61_Y44_N3
\C1|G[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|G~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|G\(0));

-- Location: LCCOMB_X61_Y44_N20
\C1|B~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|B~3_combout\ = (\C1|DRAW2~0_combout\ & (\C1|LessThan6~20_combout\ & (\C1|LessThan4~20_combout\ & !\SW[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|DRAW2~0_combout\,
	datab => \C1|LessThan6~20_combout\,
	datac => \C1|LessThan4~20_combout\,
	datad => \SW[1]~input_o\,
	combout => \C1|B~3_combout\);

-- Location: LCCOMB_X61_Y44_N12
\C1|B~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \C1|B~5_combout\ = (\C1|B~2_combout\) # ((\C1|B~1_combout\ & ((\C1|B~4_combout\) # (\C1|B~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C1|B~4_combout\,
	datab => \C1|B~2_combout\,
	datac => \C1|B~1_combout\,
	datad => \C1|B~3_combout\,
	combout => \C1|B~5_combout\);

-- Location: FF_X61_Y44_N13
\C1|B[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \C|altpll_0|sd1|wire_pll7_clk[1]~clkctrl_outclk\,
	d => \C1|B~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \C1|B\(0));

-- Location: IOIBUF_X0_Y4_N1
\CLOCK_24[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_24(0),
	o => \CLOCK_24[0]~input_o\);

-- Location: IOIBUF_X0_Y58_N15
\CLOCK_24[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_24(1),
	o => \CLOCK_24[1]~input_o\);
END structure;


