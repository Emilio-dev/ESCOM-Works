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

-- DATE "05/06/2022 00:14:53"

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

ENTITY 	Pila IS
    PORT (
	Data_In : IN std_logic_vector(7 DOWNTO 0);
	D1 : OUT std_logic_vector(6 DOWNTO 0);
	D2 : OUT std_logic_vector(6 DOWNTO 0);
	D3 : OUT std_logic_vector(6 DOWNTO 0);
	D4 : OUT std_logic_vector(6 DOWNTO 0);
	D5 : OUT std_logic_vector(6 DOWNTO 0);
	Datos : OUT std_logic_vector(7 DOWNTO 0);
	Reset : IN std_logic;
	clk : IN std_logic;
	Enable : IN std_logic;
	PUSH_barPOP : IN std_logic;
	confirm : IN std_logic;
	E : OUT std_logic;
	RS : OUT std_logic;
	RW : OUT std_logic;
	Stack_Empty : OUT std_logic;
	Stack_Full : OUT std_logic
	);
END Pila;

-- Design Ports Information
-- D1[0]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1[1]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1[2]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1[3]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1[4]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1[5]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1[6]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[0]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[1]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[2]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[3]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[4]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[5]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2[6]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[0]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[1]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[2]	=>  Location: PIN_AE25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[3]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[4]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[5]	=>  Location: PIN_AD4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3[6]	=>  Location: PIN_AE15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[0]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[1]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[2]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[3]	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[4]	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[5]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D4[6]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[0]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[1]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[2]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[3]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[4]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[5]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D5[6]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Datos[0]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Datos[1]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Datos[2]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Datos[3]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Datos[4]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Datos[5]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Datos[6]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Datos[7]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RS	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RW	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Stack_Empty	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Stack_Full	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[0]	=>  Location: PIN_J28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[1]	=>  Location: PIN_J27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[2]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[3]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[4]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[5]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[6]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- confirm	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Enable	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PUSH_barPOP	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Pila IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Data_In : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_D1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_D2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_D3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_D4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_D5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_Datos : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Reset : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_Enable : std_logic;
SIGNAL ww_PUSH_barPOP : std_logic;
SIGNAL ww_confirm : std_logic;
SIGNAL ww_E : std_logic;
SIGNAL ww_RS : std_logic;
SIGNAL ww_RW : std_logic;
SIGNAL ww_Stack_Empty : std_logic;
SIGNAL ww_Stack_Full : std_logic;
SIGNAL \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \Reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_dly~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
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
SIGNAL \Datos[0]~output_o\ : std_logic;
SIGNAL \Datos[1]~output_o\ : std_logic;
SIGNAL \Datos[2]~output_o\ : std_logic;
SIGNAL \Datos[3]~output_o\ : std_logic;
SIGNAL \Datos[4]~output_o\ : std_logic;
SIGNAL \Datos[5]~output_o\ : std_logic;
SIGNAL \Datos[6]~output_o\ : std_logic;
SIGNAL \Datos[7]~output_o\ : std_logic;
SIGNAL \E~output_o\ : std_logic;
SIGNAL \RS~output_o\ : std_logic;
SIGNAL \RW~output_o\ : std_logic;
SIGNAL \Stack_Empty~output_o\ : std_logic;
SIGNAL \Stack_Full~output_o\ : std_logic;
SIGNAL \Data_In[0]~input_o\ : std_logic;
SIGNAL \Data_In[3]~input_o\ : std_logic;
SIGNAL \Data_In[1]~input_o\ : std_logic;
SIGNAL \Data_In[2]~input_o\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Data_In[4]~input_o\ : std_logic;
SIGNAL \Data_In[7]~input_o\ : std_logic;
SIGNAL \Data_In[6]~input_o\ : std_logic;
SIGNAL \Data_In[5]~input_o\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
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
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \count_dly[12]~39\ : std_logic;
SIGNAL \count_dly[13]~40_combout\ : std_logic;
SIGNAL \LessThan3~2_combout\ : std_logic;
SIGNAL \clk_dly~0_combout\ : std_logic;
SIGNAL \clk_dly~q\ : std_logic;
SIGNAL \clk_dly~clkctrl_outclk\ : std_logic;
SIGNAL \WideOr9~0_combout\ : std_logic;
SIGNAL \LCD:contador2[0]~0_combout\ : std_logic;
SIGNAL \LCD:contador2[0]~q\ : std_logic;
SIGNAL \LCD:contador2[3]~0_combout\ : std_logic;
SIGNAL \LCD:contador2[1]~0_combout\ : std_logic;
SIGNAL \LCD:contador2[1]~q\ : std_logic;
SIGNAL \LCD:contador2[2]~2_combout\ : std_logic;
SIGNAL \LCD:contador2[2]~q\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \LCD:contador2[3]~1_combout\ : std_logic;
SIGNAL \LCD:contador2[3]~q\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \Selector22~0_combout\ : std_logic;
SIGNAL \confirm~input_o\ : std_logic;
SIGNAL \Selector24~1_combout\ : std_logic;
SIGNAL \Selector24~0_combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \LCD:contador[3]~0_combout\ : std_logic;
SIGNAL \LCD:contador[0]~q\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \LCD:contador[1]~q\ : std_logic;
SIGNAL \LCD:contador2[3]~2_combout\ : std_logic;
SIGNAL \Selector22~1_combout\ : std_logic;
SIGNAL \Selector24~2_combout\ : std_logic;
SIGNAL \next_state.ASK3~feeder_combout\ : std_logic;
SIGNAL \next_state.ASK3~q\ : std_logic;
SIGNAL \Reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \current_state.ASK3~q\ : std_logic;
SIGNAL \Selector17~1_combout\ : std_logic;
SIGNAL \Selector7~6_combout\ : std_logic;
SIGNAL \Selector17~2_combout\ : std_logic;
SIGNAL \Selector17~3_combout\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \Selector17~4_combout\ : std_logic;
SIGNAL \next_state.LCD_CLR~q\ : std_logic;
SIGNAL \current_state.LCD_CLR~q\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \Selector19~1_combout\ : std_logic;
SIGNAL \Selector19~2_combout\ : std_logic;
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
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \Selector20~1_combout\ : std_logic;
SIGNAL \Selector20~2_combout\ : std_logic;
SIGNAL \next_state.ASK1~feeder_combout\ : std_logic;
SIGNAL \next_state.ASK1~q\ : std_logic;
SIGNAL \current_state.ASK1~q\ : std_logic;
SIGNAL \WideOr2~combout\ : std_logic;
SIGNAL \Selector16~1_combout\ : std_logic;
SIGNAL \Selector16~2_combout\ : std_logic;
SIGNAL \Selector16~3_combout\ : std_logic;
SIGNAL \Selector16~4_combout\ : std_logic;
SIGNAL \next_state.D_OFF~feeder_combout\ : std_logic;
SIGNAL \next_state.D_OFF~q\ : std_logic;
SIGNAL \current_state.D_OFF~q\ : std_logic;
SIGNAL \E~0_combout\ : std_logic;
SIGNAL \E~3_combout\ : std_logic;
SIGNAL \Selector21~2_combout\ : std_logic;
SIGNAL \Selector26~0_combout\ : std_logic;
SIGNAL \Selector26~1_combout\ : std_logic;
SIGNAL \next_state.L2~q\ : std_logic;
SIGNAL \current_state.L2~q\ : std_logic;
SIGNAL \Selector23~0_combout\ : std_logic;
SIGNAL \Selector23~1_combout\ : std_logic;
SIGNAL \next_state.ASK2~feeder_combout\ : std_logic;
SIGNAL \next_state.ASK2~q\ : std_logic;
SIGNAL \current_state.ASK2~feeder_combout\ : std_logic;
SIGNAL \current_state.ASK2~q\ : std_logic;
SIGNAL \Selector21~5_combout\ : std_logic;
SIGNAL \Selector22~2_combout\ : std_logic;
SIGNAL \Selector22~3_combout\ : std_logic;
SIGNAL \next_state.MESG2~q\ : std_logic;
SIGNAL \current_state.MESG2~q\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \next_state.LCD_INI~0_combout\ : std_logic;
SIGNAL \next_state.LCD_INI~feeder_combout\ : std_logic;
SIGNAL \next_state.LCD_INI~q\ : std_logic;
SIGNAL \current_state.LCD_INI~q\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \LCD:contador[2]~q\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LCD:numMen~1_combout\ : std_logic;
SIGNAL \Selector21~3_combout\ : std_logic;
SIGNAL \Selector21~4_combout\ : std_logic;
SIGNAL \next_state.MESG1~q\ : std_logic;
SIGNAL \current_state.MESG1~q\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \Mux19~0_combout\ : std_logic;
SIGNAL \Mux19~1_combout\ : std_logic;
SIGNAL \LCD:numMen~0_combout\ : std_logic;
SIGNAL \LCD:numMen~q\ : std_logic;
SIGNAL \Datos~0_combout\ : std_logic;
SIGNAL \Datos~1_combout\ : std_logic;
SIGNAL \Datos~2_combout\ : std_logic;
SIGNAL \Datos~3_combout\ : std_logic;
SIGNAL \Datos~4_combout\ : std_logic;
SIGNAL \PUSH_barPOP~input_o\ : std_logic;
SIGNAL \Enable~input_o\ : std_logic;
SIGNAL \pila~0_combout\ : std_logic;
SIGNAL \pila~4_combout\ : std_logic;
SIGNAL \prev_PP~q\ : std_logic;
SIGNAL \pila~2_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \pila:stack_ptr[7]~0_combout\ : std_logic;
SIGNAL \pila~3_combout\ : std_logic;
SIGNAL \Add2~1\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~7\ : std_logic;
SIGNAL \Add2~9\ : std_logic;
SIGNAL \Add2~11\ : std_logic;
SIGNAL \Add2~13\ : std_logic;
SIGNAL \Add2~14_combout\ : std_logic;
SIGNAL \Add2~12_combout\ : std_logic;
SIGNAL \Add2~10_combout\ : std_logic;
SIGNAL \Add2~8_combout\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~11\ : std_logic;
SIGNAL \Add3~15\ : std_logic;
SIGNAL \Add3~16_combout\ : std_logic;
SIGNAL \Add2~15\ : std_logic;
SIGNAL \Add2~17\ : std_logic;
SIGNAL \Add2~19\ : std_logic;
SIGNAL \Add2~21\ : std_logic;
SIGNAL \Add2~23\ : std_logic;
SIGNAL \Add2~25\ : std_logic;
SIGNAL \Add2~27\ : std_logic;
SIGNAL \Add2~29\ : std_logic;
SIGNAL \Add2~31\ : std_logic;
SIGNAL \Add2~33\ : std_logic;
SIGNAL \Add2~35\ : std_logic;
SIGNAL \Add2~37\ : std_logic;
SIGNAL \Add2~39\ : std_logic;
SIGNAL \Add2~41\ : std_logic;
SIGNAL \Add2~43\ : std_logic;
SIGNAL \Add2~45\ : std_logic;
SIGNAL \Add2~47\ : std_logic;
SIGNAL \Add2~49\ : std_logic;
SIGNAL \Add2~51\ : std_logic;
SIGNAL \Add2~53\ : std_logic;
SIGNAL \Add2~55\ : std_logic;
SIGNAL \Add2~57\ : std_logic;
SIGNAL \Add2~59\ : std_logic;
SIGNAL \Add2~61\ : std_logic;
SIGNAL \Add2~62_combout\ : std_logic;
SIGNAL \Add2~60_combout\ : std_logic;
SIGNAL \Add2~56_combout\ : std_logic;
SIGNAL \Add2~58_combout\ : std_logic;
SIGNAL \Equal3~9_combout\ : std_logic;
SIGNAL \Add2~50_combout\ : std_logic;
SIGNAL \Add2~54_combout\ : std_logic;
SIGNAL \Add2~52_combout\ : std_logic;
SIGNAL \Add2~46_combout\ : std_logic;
SIGNAL \Add2~48_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \Equal3~1_combout\ : std_logic;
SIGNAL \Add2~22_combout\ : std_logic;
SIGNAL \Add2~16_combout\ : std_logic;
SIGNAL \Add2~18_combout\ : std_logic;
SIGNAL \Add2~20_combout\ : std_logic;
SIGNAL \Equal3~2_combout\ : std_logic;
SIGNAL \Add2~28_combout\ : std_logic;
SIGNAL \Add2~30_combout\ : std_logic;
SIGNAL \Add2~26_combout\ : std_logic;
SIGNAL \Add2~24_combout\ : std_logic;
SIGNAL \Equal3~3_combout\ : std_logic;
SIGNAL \Equal3~4_combout\ : std_logic;
SIGNAL \Add2~40_combout\ : std_logic;
SIGNAL \Add2~42_combout\ : std_logic;
SIGNAL \Add2~44_combout\ : std_logic;
SIGNAL \Add2~36_combout\ : std_logic;
SIGNAL \Add2~32_combout\ : std_logic;
SIGNAL \Add2~34_combout\ : std_logic;
SIGNAL \Add2~38_combout\ : std_logic;
SIGNAL \Equal3~5_combout\ : std_logic;
SIGNAL \Equal3~6_combout\ : std_logic;
SIGNAL \Equal3~7_combout\ : std_logic;
SIGNAL \Equal3~8_combout\ : std_logic;
SIGNAL \Equal3~10_combout\ : std_logic;
SIGNAL \Add3~91_combout\ : std_logic;
SIGNAL \pila:stack_ptr[7]~q\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \pila:stack_ptr[8]~0_combout\ : std_logic;
SIGNAL \Add3~17\ : std_logic;
SIGNAL \Add3~18_combout\ : std_logic;
SIGNAL \Add3~90_combout\ : std_logic;
SIGNAL \pila:stack_ptr[8]~q\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \pila:stack_ptr[9]~0_combout\ : std_logic;
SIGNAL \Add3~19\ : std_logic;
SIGNAL \Add3~20_combout\ : std_logic;
SIGNAL \Add3~89_combout\ : std_logic;
SIGNAL \pila:stack_ptr[9]~q\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \pila:stack_ptr[10]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[10]~feeder_combout\ : std_logic;
SIGNAL \Add3~21\ : std_logic;
SIGNAL \Add3~22_combout\ : std_logic;
SIGNAL \Add3~88_combout\ : std_logic;
SIGNAL \pila:stack_ptr[10]~q\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add1~21\ : std_logic;
SIGNAL \Add1~22_combout\ : std_logic;
SIGNAL \pila:stack_ptr[11]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[11]~feeder_combout\ : std_logic;
SIGNAL \Add3~23\ : std_logic;
SIGNAL \Add3~24_combout\ : std_logic;
SIGNAL \Add3~87_combout\ : std_logic;
SIGNAL \pila:stack_ptr[11]~q\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Add1~23\ : std_logic;
SIGNAL \Add1~24_combout\ : std_logic;
SIGNAL \pila:stack_ptr[12]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[12]~feeder_combout\ : std_logic;
SIGNAL \Add3~25\ : std_logic;
SIGNAL \Add3~26_combout\ : std_logic;
SIGNAL \Add3~86_combout\ : std_logic;
SIGNAL \pila:stack_ptr[12]~q\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \Add1~25\ : std_logic;
SIGNAL \Add1~26_combout\ : std_logic;
SIGNAL \pila:stack_ptr[13]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[13]~feeder_combout\ : std_logic;
SIGNAL \Add3~27\ : std_logic;
SIGNAL \Add3~28_combout\ : std_logic;
SIGNAL \Add3~85_combout\ : std_logic;
SIGNAL \pila:stack_ptr[13]~q\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \Add1~27\ : std_logic;
SIGNAL \Add1~28_combout\ : std_logic;
SIGNAL \pila:stack_ptr[14]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[14]~feeder_combout\ : std_logic;
SIGNAL \Add3~29\ : std_logic;
SIGNAL \Add3~30_combout\ : std_logic;
SIGNAL \Add3~84_combout\ : std_logic;
SIGNAL \pila:stack_ptr[14]~q\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \Add1~29\ : std_logic;
SIGNAL \Add1~30_combout\ : std_logic;
SIGNAL \pila:stack_ptr[15]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[15]~feeder_combout\ : std_logic;
SIGNAL \Add3~31\ : std_logic;
SIGNAL \Add3~32_combout\ : std_logic;
SIGNAL \Add3~83_combout\ : std_logic;
SIGNAL \pila:stack_ptr[15]~q\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \Add1~31\ : std_logic;
SIGNAL \Add1~32_combout\ : std_logic;
SIGNAL \pila:stack_ptr[16]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[16]~feeder_combout\ : std_logic;
SIGNAL \Add3~33\ : std_logic;
SIGNAL \Add3~34_combout\ : std_logic;
SIGNAL \Add3~82_combout\ : std_logic;
SIGNAL \pila:stack_ptr[16]~q\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \Add1~33\ : std_logic;
SIGNAL \Add1~34_combout\ : std_logic;
SIGNAL \pila:stack_ptr[17]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[17]~feeder_combout\ : std_logic;
SIGNAL \Add3~35\ : std_logic;
SIGNAL \Add3~36_combout\ : std_logic;
SIGNAL \Add3~81_combout\ : std_logic;
SIGNAL \pila:stack_ptr[17]~q\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \Add1~35\ : std_logic;
SIGNAL \Add1~36_combout\ : std_logic;
SIGNAL \pila:stack_ptr[18]~0_combout\ : std_logic;
SIGNAL \Add3~37\ : std_logic;
SIGNAL \Add3~38_combout\ : std_logic;
SIGNAL \Add3~80_combout\ : std_logic;
SIGNAL \pila:stack_ptr[18]~q\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \Add1~37\ : std_logic;
SIGNAL \Add1~38_combout\ : std_logic;
SIGNAL \pila:stack_ptr[19]~0_combout\ : std_logic;
SIGNAL \Add3~39\ : std_logic;
SIGNAL \Add3~40_combout\ : std_logic;
SIGNAL \Add3~79_combout\ : std_logic;
SIGNAL \pila:stack_ptr[19]~q\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \Add1~39\ : std_logic;
SIGNAL \Add1~40_combout\ : std_logic;
SIGNAL \pila:stack_ptr[20]~0_combout\ : std_logic;
SIGNAL \Add3~41\ : std_logic;
SIGNAL \Add3~42_combout\ : std_logic;
SIGNAL \Add3~78_combout\ : std_logic;
SIGNAL \pila:stack_ptr[20]~q\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \Add1~41\ : std_logic;
SIGNAL \Add1~42_combout\ : std_logic;
SIGNAL \pila:stack_ptr[21]~0_combout\ : std_logic;
SIGNAL \Add3~43\ : std_logic;
SIGNAL \Add3~44_combout\ : std_logic;
SIGNAL \Add3~77_combout\ : std_logic;
SIGNAL \pila:stack_ptr[21]~q\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \Add1~43\ : std_logic;
SIGNAL \Add1~44_combout\ : std_logic;
SIGNAL \pila:stack_ptr[22]~0_combout\ : std_logic;
SIGNAL \Add3~45\ : std_logic;
SIGNAL \Add3~46_combout\ : std_logic;
SIGNAL \Add3~76_combout\ : std_logic;
SIGNAL \pila:stack_ptr[22]~q\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \Add1~45\ : std_logic;
SIGNAL \Add1~46_combout\ : std_logic;
SIGNAL \pila:stack_ptr[23]~0_combout\ : std_logic;
SIGNAL \Add3~47\ : std_logic;
SIGNAL \Add3~48_combout\ : std_logic;
SIGNAL \Add3~75_combout\ : std_logic;
SIGNAL \pila:stack_ptr[23]~q\ : std_logic;
SIGNAL \Add0~45\ : std_logic;
SIGNAL \Add0~46_combout\ : std_logic;
SIGNAL \Add1~47\ : std_logic;
SIGNAL \Add1~48_combout\ : std_logic;
SIGNAL \pila:stack_ptr[24]~0_combout\ : std_logic;
SIGNAL \Add3~49\ : std_logic;
SIGNAL \Add3~50_combout\ : std_logic;
SIGNAL \Add3~74_combout\ : std_logic;
SIGNAL \pila:stack_ptr[24]~q\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~48_combout\ : std_logic;
SIGNAL \Add1~49\ : std_logic;
SIGNAL \Add1~50_combout\ : std_logic;
SIGNAL \pila:stack_ptr[25]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[25]~feeder_combout\ : std_logic;
SIGNAL \Add3~51\ : std_logic;
SIGNAL \Add3~52_combout\ : std_logic;
SIGNAL \Add3~73_combout\ : std_logic;
SIGNAL \pila:stack_ptr[25]~q\ : std_logic;
SIGNAL \Add0~49\ : std_logic;
SIGNAL \Add0~50_combout\ : std_logic;
SIGNAL \Add1~51\ : std_logic;
SIGNAL \Add1~52_combout\ : std_logic;
SIGNAL \pila:stack_ptr[26]~0_combout\ : std_logic;
SIGNAL \Add3~53\ : std_logic;
SIGNAL \Add3~54_combout\ : std_logic;
SIGNAL \Add3~72_combout\ : std_logic;
SIGNAL \pila:stack_ptr[26]~q\ : std_logic;
SIGNAL \Add0~51\ : std_logic;
SIGNAL \Add0~52_combout\ : std_logic;
SIGNAL \Add1~53\ : std_logic;
SIGNAL \Add1~54_combout\ : std_logic;
SIGNAL \pila:stack_ptr[27]~0_combout\ : std_logic;
SIGNAL \Add3~55\ : std_logic;
SIGNAL \Add3~56_combout\ : std_logic;
SIGNAL \Add3~71_combout\ : std_logic;
SIGNAL \pila:stack_ptr[27]~q\ : std_logic;
SIGNAL \Add0~53\ : std_logic;
SIGNAL \Add0~54_combout\ : std_logic;
SIGNAL \Add1~55\ : std_logic;
SIGNAL \Add1~56_combout\ : std_logic;
SIGNAL \pila:stack_ptr[28]~0_combout\ : std_logic;
SIGNAL \Add3~57\ : std_logic;
SIGNAL \Add3~58_combout\ : std_logic;
SIGNAL \Add3~70_combout\ : std_logic;
SIGNAL \pila:stack_ptr[28]~q\ : std_logic;
SIGNAL \Add0~55\ : std_logic;
SIGNAL \Add0~56_combout\ : std_logic;
SIGNAL \Add1~57\ : std_logic;
SIGNAL \Add1~58_combout\ : std_logic;
SIGNAL \pila:stack_ptr[29]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[29]~feeder_combout\ : std_logic;
SIGNAL \Add3~59\ : std_logic;
SIGNAL \Add3~60_combout\ : std_logic;
SIGNAL \Add3~69_combout\ : std_logic;
SIGNAL \pila:stack_ptr[29]~q\ : std_logic;
SIGNAL \Add0~57\ : std_logic;
SIGNAL \Add0~58_combout\ : std_logic;
SIGNAL \Add1~59\ : std_logic;
SIGNAL \Add1~60_combout\ : std_logic;
SIGNAL \pila:stack_ptr[30]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[30]~feeder_combout\ : std_logic;
SIGNAL \Add3~61\ : std_logic;
SIGNAL \Add3~62_combout\ : std_logic;
SIGNAL \Add3~67_combout\ : std_logic;
SIGNAL \pila:stack_ptr[30]~q\ : std_logic;
SIGNAL \Add0~59\ : std_logic;
SIGNAL \Add0~60_combout\ : std_logic;
SIGNAL \Add1~61\ : std_logic;
SIGNAL \Add1~62_combout\ : std_logic;
SIGNAL \pila:stack_ptr[31]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[31]~feeder_combout\ : std_logic;
SIGNAL \Add3~63\ : std_logic;
SIGNAL \Add3~64_combout\ : std_logic;
SIGNAL \Add3~66_combout\ : std_logic;
SIGNAL \pila:stack_ptr[31]~q\ : std_logic;
SIGNAL \Add0~61\ : std_logic;
SIGNAL \Add0~62_combout\ : std_logic;
SIGNAL \stack_ptr~2_combout\ : std_logic;
SIGNAL \Equal1~5_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \Equal1~3_combout\ : std_logic;
SIGNAL \Equal1~4_combout\ : std_logic;
SIGNAL \stack_ptr~0_combout\ : std_logic;
SIGNAL \stack_ptr~1_combout\ : std_logic;
SIGNAL \stack_ptr~3_combout\ : std_logic;
SIGNAL \stack_ptr~4_combout\ : std_logic;
SIGNAL \pila:stack_ptr[0]~0_combout\ : std_logic;
SIGNAL \pila:stack_ptr[0]~feeder_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \Add3~95_combout\ : std_logic;
SIGNAL \pila:stack_ptr[0]~q\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \pila:stack_ptr[1]~0_combout\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Add3~94_combout\ : std_logic;
SIGNAL \pila:stack_ptr[1]~q\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \stack_ptr~5_combout\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \Add3~13_combout\ : std_logic;
SIGNAL \pila:stack_ptr[2]~q\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \pila:stack_ptr[3]~0_combout\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \Add3~93_combout\ : std_logic;
SIGNAL \pila:stack_ptr[3]~q\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \pila:stack_ptr[4]~0_combout\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \Add3~92_combout\ : std_logic;
SIGNAL \pila:stack_ptr[4]~q\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \stack_ptr~6_combout\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \Add3~12_combout\ : std_logic;
SIGNAL \pila:stack_ptr[5]~q\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \stack_ptr~7_combout\ : std_logic;
SIGNAL \Add3~14_combout\ : std_logic;
SIGNAL \Add3~68_combout\ : std_logic;
SIGNAL \pila:stack_ptr[6]~q\ : std_logic;
SIGNAL \full~0_combout\ : std_logic;
SIGNAL \full~3_combout\ : std_logic;
SIGNAL \full~2_combout\ : std_logic;
SIGNAL \full~1_combout\ : std_logic;
SIGNAL \full~4_combout\ : std_logic;
SIGNAL \full~5_combout\ : std_logic;
SIGNAL \full~8_combout\ : std_logic;
SIGNAL \full~6_combout\ : std_logic;
SIGNAL \full~7_combout\ : std_logic;
SIGNAL \full~9_combout\ : std_logic;
SIGNAL \full~10_combout\ : std_logic;
SIGNAL \full~11_combout\ : std_logic;
SIGNAL \full~q\ : std_logic;
SIGNAL \pila~1_combout\ : std_logic;
SIGNAL \empty~0_combout\ : std_logic;
SIGNAL \empty~1_combout\ : std_logic;
SIGNAL \empty~4_combout\ : std_logic;
SIGNAL \empty~2_combout\ : std_logic;
SIGNAL \empty~5_combout\ : std_logic;
SIGNAL \empty~3_combout\ : std_logic;
SIGNAL \empty~6_combout\ : std_logic;
SIGNAL \empty~8_combout\ : std_logic;
SIGNAL \empty~9_combout\ : std_logic;
SIGNAL \empty~7_combout\ : std_logic;
SIGNAL \empty~10_combout\ : std_logic;
SIGNAL \empty~11_combout\ : std_logic;
SIGNAL \empty~q\ : std_logic;
SIGNAL \stack_mem~25_combout\ : std_logic;
SIGNAL \stack_mem~16_q\ : std_logic;
SIGNAL \stack_mem~26_combout\ : std_logic;
SIGNAL \stack_mem_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \stack_mem~20_combout\ : std_logic;
SIGNAL \stack_mem_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \stack_mem~17_combout\ : std_logic;
SIGNAL \stack_mem_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \stack_mem~18_combout\ : std_logic;
SIGNAL \stack_mem_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \stack_mem~19_combout\ : std_logic;
SIGNAL \Mux39~0_combout\ : std_logic;
SIGNAL \Mux39~1_combout\ : std_logic;
SIGNAL \stack_mem_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \Mux39~4_combout\ : std_logic;
SIGNAL \stack_mem_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \stack_mem_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \Mux39~2_combout\ : std_logic;
SIGNAL \stack_mem_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \stack_mem~21_combout\ : std_logic;
SIGNAL \Mux39~3_combout\ : std_logic;
SIGNAL \Mux39~5_combout\ : std_logic;
SIGNAL \stack_mem~23_combout\ : std_logic;
SIGNAL \stack_mem~24_combout\ : std_logic;
SIGNAL \Mux25~0_combout\ : std_logic;
SIGNAL \stack_mem~22_combout\ : std_logic;
SIGNAL \Mux31~0_combout\ : std_logic;
SIGNAL \Mux39~6_combout\ : std_logic;
SIGNAL \Mux39~7_combout\ : std_logic;
SIGNAL \Selector8~1_combout\ : std_logic;
SIGNAL \Selector8~2_combout\ : std_logic;
SIGNAL \Datos[0]~reg0_q\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Selector7~1_combout\ : std_logic;
SIGNAL \Selector7~2_combout\ : std_logic;
SIGNAL \Mux24~0_combout\ : std_logic;
SIGNAL \Mux30~0_combout\ : std_logic;
SIGNAL \Selector7~3_combout\ : std_logic;
SIGNAL \Selector7~4_combout\ : std_logic;
SIGNAL \Selector7~5_combout\ : std_logic;
SIGNAL \Selector7~7_combout\ : std_logic;
SIGNAL \Datos[1]~reg0_q\ : std_logic;
SIGNAL \Mux17~0_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \Mux23~0_combout\ : std_logic;
SIGNAL \Mux29~0_combout\ : std_logic;
SIGNAL \Selector6~2_combout\ : std_logic;
SIGNAL \Selector6~3_combout\ : std_logic;
SIGNAL \Selector6~4_combout\ : std_logic;
SIGNAL \Selector6~5_combout\ : std_logic;
SIGNAL \Datos[2]~reg0_q\ : std_logic;
SIGNAL \Selector5~6_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector5~1_combout\ : std_logic;
SIGNAL \Selector5~2_combout\ : std_logic;
SIGNAL \Selector5~3_combout\ : std_logic;
SIGNAL \Selector5~4_combout\ : std_logic;
SIGNAL \Selector5~5_combout\ : std_logic;
SIGNAL \Selector5~7_combout\ : std_logic;
SIGNAL \Datos[3]~reg0_q\ : std_logic;
SIGNAL \Selector4~2_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Mux27~0_combout\ : std_logic;
SIGNAL \Mux35~2_combout\ : std_logic;
SIGNAL \Mux35~0_combout\ : std_logic;
SIGNAL \Mux35~1_combout\ : std_logic;
SIGNAL \Mux35~3_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \Selector4~3_combout\ : std_logic;
SIGNAL \Datos[4]~reg0_q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \Datos[5]~reg0_q\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~2_combout\ : std_logic;
SIGNAL \Selector2~3_combout\ : std_logic;
SIGNAL \Selector2~4_combout\ : std_logic;
SIGNAL \Selector2~5_combout\ : std_logic;
SIGNAL \Selector2~6_combout\ : std_logic;
SIGNAL \Datos[6]~reg0_q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \Datos[7]~reg0_q\ : std_logic;
SIGNAL \LCD:EN~0_combout\ : std_logic;
SIGNAL \E~1_combout\ : std_logic;
SIGNAL \E~2_combout\ : std_logic;
SIGNAL \LCD:EN~q\ : std_logic;
SIGNAL \E~4_combout\ : std_logic;
SIGNAL \E~reg0_q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \RS~reg0_q\ : std_logic;
SIGNAL count_dly : std_logic_vector(13 DOWNTO 0);
SIGNAL \ALT_INV_Reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_Data_In <= Data_In;
D1 <= ww_D1;
D2 <= ww_D2;
D3 <= ww_D3;
D4 <= ww_D4;
D5 <= ww_D5;
Datos <= ww_Datos;
ww_Reset <= Reset;
ww_clk <= clk;
ww_Enable <= Enable;
ww_PUSH_barPOP <= PUSH_barPOP;
ww_confirm <= confirm;
E <= ww_E;
RS <= ww_RS;
RW <= ww_RW;
Stack_Empty <= ww_Stack_Empty;
Stack_Full <= ww_Stack_Full;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\stack_mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & \Data_In[7]~input_o\
& \Data_In[6]~input_o\ & \Data_In[5]~input_o\ & \Data_In[4]~input_o\ & \Data_In[3]~input_o\ & \Data_In[2]~input_o\ & \Data_In[1]~input_o\ & \Data_In[0]~input_o\);

\stack_mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\Add2~12_combout\ & \Add2~10_combout\ & \Add2~8_combout\ & \Add2~6_combout\ & \Add2~4_combout\ & \Add2~2_combout\ & \Add2~0_combout\);

\stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\Add0~12_combout\ & \Add0~10_combout\ & \Add0~8_combout\ & \Add0~6_combout\ & \Add0~4_combout\ & \Add0~2_combout\ & \Add0~0_combout\);

\stack_mem_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\stack_mem_rtl_0|auto_generated|ram_block1a1\ <= \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\stack_mem_rtl_0|auto_generated|ram_block1a2\ <= \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\stack_mem_rtl_0|auto_generated|ram_block1a3\ <= \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\stack_mem_rtl_0|auto_generated|ram_block1a4\ <= \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\stack_mem_rtl_0|auto_generated|ram_block1a5\ <= \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\stack_mem_rtl_0|auto_generated|ram_block1a6\ <= \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\stack_mem_rtl_0|auto_generated|ram_block1a7\ <= \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);

\Reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Reset~input_o\);

\clk_dly~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_dly~q\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_Reset~inputclkctrl_outclk\ <= NOT \Reset~inputclkctrl_outclk\;
\ALT_INV_Mux7~0_combout\ <= NOT \Mux7~0_combout\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X52_Y73_N16
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

-- Location: IOOBUF_X52_Y73_N2
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

-- Location: IOOBUF_X54_Y73_N2
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

-- Location: IOOBUF_X58_Y73_N2
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

-- Location: IOOBUF_X47_Y73_N2
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

-- Location: IOOBUF_X54_Y73_N9
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

-- Location: IOOBUF_X52_Y73_N23
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

-- Location: IOOBUF_X60_Y73_N2
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

-- Location: IOOBUF_X67_Y73_N9
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

-- Location: IOOBUF_X69_Y73_N23
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

-- Location: IOOBUF_X60_Y73_N9
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

-- Location: IOOBUF_X65_Y73_N23
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

-- Location: IOOBUF_X65_Y73_N16
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

-- Location: IOOBUF_X72_Y73_N16
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

-- Location: IOOBUF_X74_Y0_N2
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

-- Location: IOOBUF_X87_Y73_N23
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

-- Location: IOOBUF_X89_Y0_N9
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

-- Location: IOOBUF_X18_Y73_N23
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

-- Location: IOOBUF_X42_Y0_N23
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

-- Location: IOOBUF_X1_Y0_N9
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

-- Location: IOOBUF_X60_Y0_N9
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

-- Location: IOOBUF_X3_Y73_N23
\D4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D4[0]~output_o\);

-- Location: IOOBUF_X74_Y0_N9
\D4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D4[1]~output_o\);

-- Location: IOOBUF_X115_Y14_N9
\D4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D4[2]~output_o\);

-- Location: IOOBUF_X0_Y15_N16
\D4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D4[3]~output_o\);

-- Location: IOOBUF_X91_Y0_N16
\D4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D4[4]~output_o\);

-- Location: IOOBUF_X0_Y24_N9
\D4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D4[5]~output_o\);

-- Location: IOOBUF_X54_Y0_N16
\D4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D4[6]~output_o\);

-- Location: IOOBUF_X1_Y73_N16
\D5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D5[0]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\D5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D5[1]~output_o\);

-- Location: IOOBUF_X60_Y0_N2
\D5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D5[2]~output_o\);

-- Location: IOOBUF_X0_Y35_N2
\D5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D5[3]~output_o\);

-- Location: IOOBUF_X81_Y73_N16
\D5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D5[4]~output_o\);

-- Location: IOOBUF_X23_Y73_N23
\D5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D5[5]~output_o\);

-- Location: IOOBUF_X0_Y65_N16
\D5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \D5[6]~output_o\);

-- Location: IOOBUF_X67_Y73_N16
\Datos[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Datos[0]~reg0_q\,
	devoe => ww_devoe,
	o => \Datos[0]~output_o\);

-- Location: IOOBUF_X58_Y73_N23
\Datos[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Datos[1]~reg0_q\,
	devoe => ww_devoe,
	o => \Datos[1]~output_o\);

-- Location: IOOBUF_X58_Y73_N16
\Datos[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Datos[2]~reg0_q\,
	devoe => ww_devoe,
	o => \Datos[2]~output_o\);

-- Location: IOOBUF_X62_Y73_N16
\Datos[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Datos[3]~reg0_q\,
	devoe => ww_devoe,
	o => \Datos[3]~output_o\);

-- Location: IOOBUF_X74_Y73_N16
\Datos[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Datos[4]~reg0_q\,
	devoe => ww_devoe,
	o => \Datos[4]~output_o\);

-- Location: IOOBUF_X74_Y73_N23
\Datos[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Datos[5]~reg0_q\,
	devoe => ww_devoe,
	o => \Datos[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N23
\Datos[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Datos[6]~reg0_q\,
	devoe => ww_devoe,
	o => \Datos[6]~output_o\);

-- Location: IOOBUF_X62_Y73_N23
\Datos[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Datos[7]~reg0_q\,
	devoe => ww_devoe,
	o => \Datos[7]~output_o\);

-- Location: IOOBUF_X60_Y73_N16
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

-- Location: IOOBUF_X67_Y73_N2
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

-- Location: IOOBUF_X94_Y0_N2
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

-- Location: IOOBUF_X49_Y73_N16
\Stack_Empty~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \empty~q\,
	devoe => ww_devoe,
	o => \Stack_Empty~output_o\);

-- Location: IOOBUF_X52_Y73_N9
\Stack_Full~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \full~q\,
	devoe => ww_devoe,
	o => \Stack_Full~output_o\);

-- Location: IOIBUF_X115_Y37_N8
\Data_In[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(0),
	o => \Data_In[0]~input_o\);

-- Location: IOIBUF_X49_Y73_N22
\Data_In[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(3),
	o => \Data_In[3]~input_o\);

-- Location: IOIBUF_X115_Y37_N1
\Data_In[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(1),
	o => \Data_In[1]~input_o\);

-- Location: IOIBUF_X60_Y73_N22
\Data_In[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(2),
	o => \Data_In[2]~input_o\);

-- Location: LCCOMB_X59_Y69_N4
\Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\Data_In[3]~input_o\ & (((\Data_In[1]~input_o\ & \Data_In[2]~input_o\)))) # (!\Data_In[3]~input_o\ & (!\Data_In[1]~input_o\ & (\Data_In[0]~input_o\ $ (\Data_In[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[0]~input_o\,
	datab => \Data_In[3]~input_o\,
	datac => \Data_In[1]~input_o\,
	datad => \Data_In[2]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X59_Y69_N6
\Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (!\Data_In[3]~input_o\ & (\Data_In[2]~input_o\ & (\Data_In[0]~input_o\ $ (\Data_In[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[0]~input_o\,
	datab => \Data_In[3]~input_o\,
	datac => \Data_In[1]~input_o\,
	datad => \Data_In[2]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X59_Y69_N12
\Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\Data_In[0]~input_o\ & (\Data_In[3]~input_o\ & (\Data_In[1]~input_o\ $ (\Data_In[2]~input_o\)))) # (!\Data_In[0]~input_o\ & (!\Data_In[3]~input_o\ & (\Data_In[1]~input_o\ & !\Data_In[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[0]~input_o\,
	datab => \Data_In[3]~input_o\,
	datac => \Data_In[1]~input_o\,
	datad => \Data_In[2]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X59_Y69_N2
\Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\Data_In[0]~input_o\ & (\Data_In[3]~input_o\ $ (\Data_In[1]~input_o\ $ (!\Data_In[2]~input_o\)))) # (!\Data_In[0]~input_o\ & ((\Data_In[1]~input_o\ & (\Data_In[3]~input_o\)) # (!\Data_In[1]~input_o\ & ((\Data_In[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110111000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[0]~input_o\,
	datab => \Data_In[3]~input_o\,
	datac => \Data_In[1]~input_o\,
	datad => \Data_In[2]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X59_Y69_N24
\Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\Data_In[0]~input_o\) # ((\Data_In[2]~input_o\ & ((\Data_In[3]~input_o\) # (!\Data_In[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[0]~input_o\,
	datab => \Data_In[3]~input_o\,
	datac => \Data_In[1]~input_o\,
	datad => \Data_In[2]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X59_Y69_N10
\Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\Data_In[0]~input_o\ & ((\Data_In[1]~input_o\) # ((!\Data_In[3]~input_o\ & !\Data_In[2]~input_o\)))) # (!\Data_In[0]~input_o\ & (\Data_In[1]~input_o\ & (\Data_In[3]~input_o\ $ (!\Data_In[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[0]~input_o\,
	datab => \Data_In[3]~input_o\,
	datac => \Data_In[1]~input_o\,
	datad => \Data_In[2]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X59_Y69_N0
\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\Data_In[3]~input_o\ & (!\Data_In[2]~input_o\ & ((!\Data_In[1]~input_o\) # (!\Data_In[0]~input_o\)))) # (!\Data_In[3]~input_o\ & ((\Data_In[1]~input_o\ & ((!\Data_In[2]~input_o\) # (!\Data_In[0]~input_o\))) # (!\Data_In[1]~input_o\ & 
-- ((\Data_In[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[0]~input_o\,
	datab => \Data_In[3]~input_o\,
	datac => \Data_In[1]~input_o\,
	datad => \Data_In[2]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: IOIBUF_X69_Y73_N1
\Data_In[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(4),
	o => \Data_In[4]~input_o\);

-- Location: IOIBUF_X72_Y73_N1
\Data_In[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(7),
	o => \Data_In[7]~input_o\);

-- Location: IOIBUF_X69_Y73_N15
\Data_In[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(6),
	o => \Data_In[6]~input_o\);

-- Location: IOIBUF_X72_Y73_N8
\Data_In[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(5),
	o => \Data_In[5]~input_o\);

-- Location: LCCOMB_X65_Y70_N0
\Mux13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (\Data_In[7]~input_o\ & (((\Data_In[6]~input_o\ & \Data_In[5]~input_o\)))) # (!\Data_In[7]~input_o\ & (!\Data_In[5]~input_o\ & (\Data_In[4]~input_o\ $ (\Data_In[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[4]~input_o\,
	datab => \Data_In[7]~input_o\,
	datac => \Data_In[6]~input_o\,
	datad => \Data_In[5]~input_o\,
	combout => \Mux13~0_combout\);

-- Location: LCCOMB_X65_Y70_N22
\Mux12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = (!\Data_In[7]~input_o\ & (\Data_In[6]~input_o\ & (\Data_In[4]~input_o\ $ (\Data_In[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[4]~input_o\,
	datab => \Data_In[7]~input_o\,
	datac => \Data_In[6]~input_o\,
	datad => \Data_In[5]~input_o\,
	combout => \Mux12~0_combout\);

-- Location: LCCOMB_X69_Y72_N0
\Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (\Data_In[7]~input_o\ & (\Data_In[4]~input_o\ & (\Data_In[6]~input_o\ $ (\Data_In[5]~input_o\)))) # (!\Data_In[7]~input_o\ & (!\Data_In[6]~input_o\ & (!\Data_In[4]~input_o\ & \Data_In[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[7]~input_o\,
	datab => \Data_In[6]~input_o\,
	datac => \Data_In[4]~input_o\,
	datad => \Data_In[5]~input_o\,
	combout => \Mux11~0_combout\);

-- Location: LCCOMB_X65_Y70_N4
\Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\Data_In[4]~input_o\ & (\Data_In[7]~input_o\ $ (\Data_In[6]~input_o\ $ (!\Data_In[5]~input_o\)))) # (!\Data_In[4]~input_o\ & ((\Data_In[5]~input_o\ & (\Data_In[7]~input_o\)) # (!\Data_In[5]~input_o\ & ((\Data_In[6]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[4]~input_o\,
	datab => \Data_In[7]~input_o\,
	datac => \Data_In[6]~input_o\,
	datad => \Data_In[5]~input_o\,
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X65_Y70_N2
\Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (\Data_In[4]~input_o\) # ((\Data_In[6]~input_o\ & ((\Data_In[7]~input_o\) # (!\Data_In[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[4]~input_o\,
	datab => \Data_In[7]~input_o\,
	datac => \Data_In[6]~input_o\,
	datad => \Data_In[5]~input_o\,
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X65_Y70_N12
\Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (\Data_In[4]~input_o\ & ((\Data_In[5]~input_o\) # ((!\Data_In[7]~input_o\ & !\Data_In[6]~input_o\)))) # (!\Data_In[4]~input_o\ & (\Data_In[5]~input_o\ & (\Data_In[7]~input_o\ $ (!\Data_In[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[4]~input_o\,
	datab => \Data_In[7]~input_o\,
	datac => \Data_In[6]~input_o\,
	datad => \Data_In[5]~input_o\,
	combout => \Mux8~0_combout\);

-- Location: LCCOMB_X69_Y72_N6
\Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\Data_In[7]~input_o\ & (!\Data_In[6]~input_o\ & ((!\Data_In[5]~input_o\) # (!\Data_In[4]~input_o\)))) # (!\Data_In[7]~input_o\ & ((\Data_In[6]~input_o\ & ((!\Data_In[5]~input_o\) # (!\Data_In[4]~input_o\))) # (!\Data_In[6]~input_o\ & 
-- ((\Data_In[5]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[7]~input_o\,
	datab => \Data_In[6]~input_o\,
	datac => \Data_In[4]~input_o\,
	datad => \Data_In[5]~input_o\,
	combout => \Mux7~0_combout\);

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

-- Location: IOIBUF_X0_Y36_N15
\Reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: LCCOMB_X61_Y69_N4
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

-- Location: FF_X61_Y69_N5
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(0));

-- Location: LCCOMB_X61_Y69_N6
\count_dly[1]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[1]~16_combout\ = (count_dly(1) & (!\count_dly[0]~15\)) # (!count_dly(1) & ((\count_dly[0]~15\) # (GND)))
-- \count_dly[1]~17\ = CARRY((!\count_dly[0]~15\) # (!count_dly(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(1),
	datad => VCC,
	cin => \count_dly[0]~15\,
	combout => \count_dly[1]~16_combout\,
	cout => \count_dly[1]~17\);

-- Location: FF_X61_Y69_N7
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(1));

-- Location: LCCOMB_X61_Y69_N8
\count_dly[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[2]~18_combout\ = (count_dly(2) & (\count_dly[1]~17\ $ (GND))) # (!count_dly(2) & (!\count_dly[1]~17\ & VCC))
-- \count_dly[2]~19\ = CARRY((count_dly(2) & !\count_dly[1]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_dly(2),
	datad => VCC,
	cin => \count_dly[1]~17\,
	combout => \count_dly[2]~18_combout\,
	cout => \count_dly[2]~19\);

-- Location: FF_X61_Y69_N9
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(2));

-- Location: LCCOMB_X61_Y69_N10
\count_dly[3]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[3]~20_combout\ = (count_dly(3) & (!\count_dly[2]~19\)) # (!count_dly(3) & ((\count_dly[2]~19\) # (GND)))
-- \count_dly[3]~21\ = CARRY((!\count_dly[2]~19\) # (!count_dly(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(3),
	datad => VCC,
	cin => \count_dly[2]~19\,
	combout => \count_dly[3]~20_combout\,
	cout => \count_dly[3]~21\);

-- Location: FF_X61_Y69_N11
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(3));

-- Location: LCCOMB_X61_Y69_N12
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

-- Location: FF_X61_Y69_N13
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(4));

-- Location: LCCOMB_X61_Y69_N14
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

-- Location: FF_X61_Y69_N15
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(5));

-- Location: LCCOMB_X61_Y69_N16
\count_dly[6]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[6]~26_combout\ = (count_dly(6) & (\count_dly[5]~25\ $ (GND))) # (!count_dly(6) & (!\count_dly[5]~25\ & VCC))
-- \count_dly[6]~27\ = CARRY((count_dly(6) & !\count_dly[5]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_dly(6),
	datad => VCC,
	cin => \count_dly[5]~25\,
	combout => \count_dly[6]~26_combout\,
	cout => \count_dly[6]~27\);

-- Location: FF_X61_Y69_N17
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(6));

-- Location: LCCOMB_X61_Y69_N18
\count_dly[7]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[7]~28_combout\ = (count_dly(7) & (!\count_dly[6]~27\)) # (!count_dly(7) & ((\count_dly[6]~27\) # (GND)))
-- \count_dly[7]~29\ = CARRY((!\count_dly[6]~27\) # (!count_dly(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_dly(7),
	datad => VCC,
	cin => \count_dly[6]~27\,
	combout => \count_dly[7]~28_combout\,
	cout => \count_dly[7]~29\);

-- Location: FF_X61_Y69_N19
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(7));

-- Location: LCCOMB_X61_Y69_N20
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

-- Location: FF_X61_Y69_N21
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(8));

-- Location: LCCOMB_X61_Y69_N22
\count_dly[9]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[9]~32_combout\ = (count_dly(9) & (!\count_dly[8]~31\)) # (!count_dly(9) & ((\count_dly[8]~31\) # (GND)))
-- \count_dly[9]~33\ = CARRY((!\count_dly[8]~31\) # (!count_dly(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(9),
	datad => VCC,
	cin => \count_dly[8]~31\,
	combout => \count_dly[9]~32_combout\,
	cout => \count_dly[9]~33\);

-- Location: FF_X61_Y69_N23
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(9));

-- Location: LCCOMB_X61_Y69_N24
\count_dly[10]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[10]~34_combout\ = (count_dly(10) & (\count_dly[9]~33\ $ (GND))) # (!count_dly(10) & (!\count_dly[9]~33\ & VCC))
-- \count_dly[10]~35\ = CARRY((count_dly(10) & !\count_dly[9]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_dly(10),
	datad => VCC,
	cin => \count_dly[9]~33\,
	combout => \count_dly[10]~34_combout\,
	cout => \count_dly[10]~35\);

-- Location: FF_X61_Y69_N25
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(10));

-- Location: LCCOMB_X61_Y69_N26
\count_dly[11]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[11]~36_combout\ = (count_dly(11) & (!\count_dly[10]~35\)) # (!count_dly(11) & ((\count_dly[10]~35\) # (GND)))
-- \count_dly[11]~37\ = CARRY((!\count_dly[10]~35\) # (!count_dly(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(11),
	datad => VCC,
	cin => \count_dly[10]~35\,
	combout => \count_dly[11]~36_combout\,
	cout => \count_dly[11]~37\);

-- Location: FF_X61_Y69_N27
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(11));

-- Location: LCCOMB_X61_Y69_N28
\count_dly[12]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[12]~38_combout\ = (count_dly(12) & (\count_dly[11]~37\ $ (GND))) # (!count_dly(12) & (!\count_dly[11]~37\ & VCC))
-- \count_dly[12]~39\ = CARRY((count_dly(12) & !\count_dly[11]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_dly(12),
	datad => VCC,
	cin => \count_dly[11]~37\,
	combout => \count_dly[12]~38_combout\,
	cout => \count_dly[12]~39\);

-- Location: FF_X61_Y69_N29
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(12));

-- Location: LCCOMB_X61_Y69_N0
\LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (!count_dly(4) & (!count_dly(6) & (!count_dly(5) & !count_dly(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(4),
	datab => count_dly(6),
	datac => count_dly(5),
	datad => count_dly(7),
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X61_Y69_N2
\LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = (((\LessThan3~0_combout\) # (!count_dly(10))) # (!count_dly(8))) # (!count_dly(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(9),
	datab => count_dly(8),
	datac => count_dly(10),
	datad => \LessThan3~0_combout\,
	combout => \LessThan3~1_combout\);

-- Location: LCCOMB_X61_Y69_N30
\count_dly[13]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_dly[13]~40_combout\ = count_dly(13) $ (\count_dly[12]~39\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(13),
	cin => \count_dly[12]~39\,
	combout => \count_dly[13]~40_combout\);

-- Location: FF_X61_Y69_N31
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
	ena => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_dly(13));

-- Location: LCCOMB_X62_Y69_N28
\LessThan3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~2_combout\ = (count_dly(13) & ((count_dly(11)) # ((count_dly(12)) # (!\LessThan3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_dly(11),
	datab => count_dly(12),
	datac => \LessThan3~1_combout\,
	datad => count_dly(13),
	combout => \LessThan3~2_combout\);

-- Location: LCCOMB_X60_Y69_N28
\clk_dly~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_dly~0_combout\ = \clk_dly~q\ $ (((\Reset~input_o\ & \LessThan3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Reset~input_o\,
	datac => \clk_dly~q\,
	datad => \LessThan3~2_combout\,
	combout => \clk_dly~0_combout\);

-- Location: FF_X60_Y69_N31
clk_dly : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \clk_dly~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_dly~q\);

-- Location: CLKCTRL_G13
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

-- Location: LCCOMB_X65_Y69_N28
\WideOr9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr9~0_combout\ = (!\current_state.MESG1~q\ & !\current_state.MESG2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.MESG1~q\,
	datad => \current_state.MESG2~q\,
	combout => \WideOr9~0_combout\);

-- Location: LCCOMB_X66_Y68_N4
\LCD:contador2[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador2[0]~0_combout\ = \LCD:contador2[0]~q\ $ (((!\WideOr9~0_combout\ & ((\LessThan1~0_combout\) # (\LessThan2~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \WideOr9~0_combout\,
	datac => \LCD:contador2[0]~q\,
	datad => \LessThan2~0_combout\,
	combout => \LCD:contador2[0]~0_combout\);

-- Location: FF_X66_Y68_N5
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

-- Location: LCCOMB_X66_Y68_N6
\LCD:contador2[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador2[3]~0_combout\ = (\current_state.MESG1~q\ & (((!\LessThan2~0_combout\ & !\LessThan1~0_combout\)))) # (!\current_state.MESG1~q\ & (((!\LessThan2~0_combout\ & !\LessThan1~0_combout\)) # (!\current_state.MESG2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG1~q\,
	datab => \current_state.MESG2~q\,
	datac => \LessThan2~0_combout\,
	datad => \LessThan1~0_combout\,
	combout => \LCD:contador2[3]~0_combout\);

-- Location: LCCOMB_X66_Y68_N26
\LCD:contador2[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador2[1]~0_combout\ = \LCD:contador2[1]~q\ $ (((\LCD:contador2[0]~q\ & !\LCD:contador2[3]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LCD:contador2[0]~q\,
	datac => \LCD:contador2[1]~q\,
	datad => \LCD:contador2[3]~0_combout\,
	combout => \LCD:contador2[1]~0_combout\);

-- Location: FF_X66_Y68_N27
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

-- Location: LCCOMB_X66_Y68_N0
\LCD:contador2[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador2[2]~2_combout\ = \LCD:contador2[2]~q\ $ (((\LCD:contador2[1]~q\ & (\LCD:contador2[0]~q\ & !\LCD:contador2[3]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[1]~q\,
	datab => \LCD:contador2[0]~q\,
	datac => \LCD:contador2[2]~q\,
	datad => \LCD:contador2[3]~0_combout\,
	combout => \LCD:contador2[2]~2_combout\);

-- Location: FF_X66_Y68_N1
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

-- Location: LCCOMB_X65_Y68_N8
\LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (!\LCD:contador2[1]~q\) # (!\LCD:contador2[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LCD:contador2[0]~q\,
	datad => \LCD:contador2[1]~q\,
	combout => \LessThan2~1_combout\);

-- Location: LCCOMB_X66_Y68_N14
\LCD:contador2[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador2[3]~1_combout\ = \LCD:contador2[3]~q\ $ (((!\LessThan2~1_combout\ & (\LCD:contador2[2]~q\ & !\LCD:contador2[3]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~1_combout\,
	datab => \LCD:contador2[2]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \LCD:contador2[3]~0_combout\,
	combout => \LCD:contador2[3]~1_combout\);

-- Location: FF_X66_Y68_N15
\LCD:contador2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \LCD:contador2[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:contador2[3]~q\);

-- Location: LCCOMB_X66_Y69_N10
\LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (\LCD:contador2[0]~q\ & (\LCD:contador2[2]~q\ & (\LCD:contador2[1]~q\ & \LCD:contador2[3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \LCD:contador2[2]~q\,
	datac => \LCD:contador2[1]~q\,
	datad => \LCD:contador2[3]~q\,
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X66_Y69_N4
\Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector22~0_combout\ = (\current_state.MESG2~q\ & !\LessThan2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG2~q\,
	datad => \LessThan2~0_combout\,
	combout => \Selector22~0_combout\);

-- Location: IOIBUF_X67_Y73_N22
\confirm~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_confirm,
	o => \confirm~input_o\);

-- Location: LCCOMB_X67_Y69_N18
\Selector24~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector24~1_combout\ = (!\LessThan1~0_combout\ & ((\current_state.MESG2~q\) # ((\current_state.L2~q\) # (!\E~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG2~q\,
	datab => \current_state.L2~q\,
	datac => \E~0_combout\,
	datad => \LessThan1~0_combout\,
	combout => \Selector24~1_combout\);

-- Location: LCCOMB_X66_Y69_N0
\Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector24~0_combout\ = (\current_state.MESG2~q\ & ((\LessThan2~0_combout\) # ((\confirm~input_o\ & \current_state.ASK3~q\)))) # (!\current_state.MESG2~q\ & (\confirm~input_o\ & (\current_state.ASK3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG2~q\,
	datab => \confirm~input_o\,
	datac => \current_state.ASK3~q\,
	datad => \LessThan2~0_combout\,
	combout => \Selector24~0_combout\);

-- Location: LCCOMB_X67_Y69_N2
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

-- Location: LCCOMB_X67_Y69_N0
\LCD:contador[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador[3]~0_combout\ = (!\WideOr2~combout\ & (((!\current_state.MESG1~q\ & !\current_state.MESG2~q\)) # (!\LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr2~combout\,
	datab => \current_state.MESG1~q\,
	datac => \LessThan2~0_combout\,
	datad => \current_state.MESG2~q\,
	combout => \LCD:contador[3]~0_combout\);

-- Location: FF_X67_Y69_N3
\LCD:contador[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector14~0_combout\,
	ena => \LCD:contador[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:contador[0]~q\);

-- Location: LCCOMB_X67_Y69_N12
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

-- Location: FF_X67_Y69_N13
\LCD:contador[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector13~0_combout\,
	ena => \LCD:contador[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:contador[1]~q\);

-- Location: LCCOMB_X66_Y69_N6
\LCD:contador2[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:contador2[3]~2_combout\ = (\LCD:contador[1]~q\) # ((\LCD:contador[2]~q\) # (\LessThan2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador[1]~q\,
	datab => \LCD:contador[2]~q\,
	datad => \LessThan2~0_combout\,
	combout => \LCD:contador2[3]~2_combout\);

-- Location: LCCOMB_X66_Y69_N18
\Selector22~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector22~1_combout\ = (\current_state.MESG1~q\ & (\LCD:contador2[3]~2_combout\ & ((\LCD:contador[2]~q\) # (\current_state.LCD_INI~q\)))) # (!\current_state.MESG1~q\ & ((\LCD:contador[2]~q\) # ((\current_state.LCD_INI~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG1~q\,
	datab => \LCD:contador[2]~q\,
	datac => \current_state.LCD_INI~q\,
	datad => \LCD:contador2[3]~2_combout\,
	combout => \Selector22~1_combout\);

-- Location: LCCOMB_X66_Y69_N26
\Selector24~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector24~2_combout\ = (\Selector24~0_combout\) # ((\next_state.ASK3~q\ & ((\Selector24~1_combout\) # (!\Selector22~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.ASK3~q\,
	datab => \Selector24~1_combout\,
	datac => \Selector24~0_combout\,
	datad => \Selector22~1_combout\,
	combout => \Selector24~2_combout\);

-- Location: LCCOMB_X62_Y69_N30
\next_state.ASK3~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.ASK3~feeder_combout\ = \Selector24~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector24~2_combout\,
	combout => \next_state.ASK3~feeder_combout\);

-- Location: FF_X62_Y69_N31
\next_state.ASK3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \next_state.ASK3~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.ASK3~q\);

-- Location: CLKCTRL_G4
\Reset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Reset~inputclkctrl_outclk\);

-- Location: FF_X62_Y69_N21
\current_state.ASK3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.ASK3~q\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.ASK3~q\);

-- Location: LCCOMB_X67_Y69_N24
\Selector17~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~1_combout\ = (\confirm~input_o\ & (((\current_state.D_OFF~q\ & \LessThan1~0_combout\)))) # (!\confirm~input_o\ & ((\current_state.ASK3~q\) # ((\current_state.D_OFF~q\ & \LessThan1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \confirm~input_o\,
	datab => \current_state.ASK3~q\,
	datac => \current_state.D_OFF~q\,
	datad => \LessThan1~0_combout\,
	combout => \Selector17~1_combout\);

-- Location: LCCOMB_X63_Y69_N30
\Selector7~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~6_combout\ = (!\current_state.ENTRY~q\ & !\current_state.D_ON~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.ENTRY~q\,
	datad => \current_state.D_ON~q\,
	combout => \Selector7~6_combout\);

-- Location: LCCOMB_X63_Y69_N22
\Selector17~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~2_combout\ = (!\current_state.L2~q\ & (!\current_state.L1~q\ & !\current_state.LCD_CLR~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L2~q\,
	datab => \current_state.L1~q\,
	datad => \current_state.LCD_CLR~q\,
	combout => \Selector17~2_combout\);

-- Location: LCCOMB_X63_Y69_N16
\Selector17~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~3_combout\ = (\current_state.D_OFF~q\) # ((!\LessThan1~0_combout\ & ((!\Selector17~2_combout\) # (!\Selector7~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.D_OFF~q\,
	datab => \Selector7~6_combout\,
	datac => \Selector17~2_combout\,
	datad => \LessThan1~0_combout\,
	combout => \Selector17~3_combout\);

-- Location: LCCOMB_X66_Y69_N8
\Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = (\WideOr9~0_combout\ & ((\LCD:contador[2]~q\) # ((\current_state.LCD_INI~q\)))) # (!\WideOr9~0_combout\ & (\LCD:contador2[3]~2_combout\ & ((\LCD:contador[2]~q\) # (\current_state.LCD_INI~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr9~0_combout\,
	datab => \LCD:contador[2]~q\,
	datac => \current_state.LCD_INI~q\,
	datad => \LCD:contador2[3]~2_combout\,
	combout => \Selector17~0_combout\);

-- Location: LCCOMB_X63_Y69_N18
\Selector17~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector17~4_combout\ = (\Selector17~1_combout\) # ((\next_state.LCD_CLR~q\ & ((\Selector17~3_combout\) # (!\Selector17~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector17~1_combout\,
	datab => \Selector17~3_combout\,
	datac => \next_state.LCD_CLR~q\,
	datad => \Selector17~0_combout\,
	combout => \Selector17~4_combout\);

-- Location: FF_X63_Y69_N23
\next_state.LCD_CLR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	asdata => \Selector17~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.LCD_CLR~q\);

-- Location: FF_X63_Y69_N19
\current_state.LCD_CLR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.LCD_CLR~q\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.LCD_CLR~q\);

-- Location: LCCOMB_X63_Y69_N10
\Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = (\current_state.L2~q\) # ((\current_state.L1~q\) # ((\current_state.D_OFF~q\) # (!\Selector7~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L2~q\,
	datab => \current_state.L1~q\,
	datac => \Selector7~6_combout\,
	datad => \current_state.D_OFF~q\,
	combout => \Selector19~0_combout\);

-- Location: LCCOMB_X63_Y69_N0
\Selector19~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector19~1_combout\ = (\current_state.LCD_CLR~q\) # (((\Selector19~0_combout\ & !\LessThan1~0_combout\)) # (!\Selector17~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector19~0_combout\,
	datab => \current_state.LCD_CLR~q\,
	datac => \LessThan1~0_combout\,
	datad => \Selector17~0_combout\,
	combout => \Selector19~1_combout\);

-- Location: LCCOMB_X63_Y69_N4
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

-- Location: FF_X63_Y69_N31
\next_state.ENTRY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	asdata => \Selector19~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.ENTRY~q\);

-- Location: FF_X63_Y69_N5
\current_state.ENTRY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.ENTRY~q\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.ENTRY~q\);

-- Location: LCCOMB_X63_Y69_N12
\Selector18~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector18~2_combout\ = (!\LessThan1~0_combout\ & ((\current_state.D_OFF~q\) # ((\current_state.D_ON~q\) # (!\Selector17~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.D_OFF~q\,
	datab => \Selector17~2_combout\,
	datac => \current_state.D_ON~q\,
	datad => \LessThan1~0_combout\,
	combout => \Selector18~2_combout\);

-- Location: LCCOMB_X63_Y69_N20
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

-- Location: LCCOMB_X63_Y69_N14
\Selector18~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector18~4_combout\ = (\Selector18~3_combout\) # ((\current_state.ENTRY~q\ & ((\LCD:contador[2]~q\) # (\LCD:contador[1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.ENTRY~q\,
	datab => \LCD:contador[2]~q\,
	datac => \LCD:contador[1]~q\,
	datad => \Selector18~3_combout\,
	combout => \Selector18~4_combout\);

-- Location: FF_X63_Y69_N15
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

-- Location: FF_X63_Y69_N13
\current_state.D_ON\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.D_ON~q\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.D_ON~q\);

-- Location: LCCOMB_X63_Y69_N6
\Selector25~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector25~2_combout\ = (!\LessThan1~0_combout\ & (((\current_state.D_OFF~q\) # (\current_state.ENTRY~q\)) # (!\Selector17~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector17~2_combout\,
	datab => \LessThan1~0_combout\,
	datac => \current_state.D_OFF~q\,
	datad => \current_state.ENTRY~q\,
	combout => \Selector25~2_combout\);

-- Location: LCCOMB_X63_Y69_N2
\Selector25~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector25~3_combout\ = (\next_state.L1~q\ & ((\current_state.D_ON~q\) # ((\Selector25~2_combout\) # (!\Selector17~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.D_ON~q\,
	datab => \Selector25~2_combout\,
	datac => \next_state.L1~q\,
	datad => \Selector17~0_combout\,
	combout => \Selector25~3_combout\);

-- Location: LCCOMB_X63_Y69_N8
\Selector25~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector25~4_combout\ = (\Selector25~3_combout\) # ((\current_state.D_ON~q\ & ((\LCD:contador[2]~q\) # (\LCD:contador[1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.D_ON~q\,
	datab => \LCD:contador[2]~q\,
	datac => \LCD:contador[1]~q\,
	datad => \Selector25~3_combout\,
	combout => \Selector25~4_combout\);

-- Location: FF_X63_Y69_N9
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

-- Location: FF_X63_Y69_N3
\current_state.L1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.L1~q\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.L1~q\);

-- Location: LCCOMB_X63_Y69_N28
\Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = (!\current_state.D_OFF~q\ & (!\current_state.LCD_CLR~q\ & (\Selector7~6_combout\ & !\current_state.L2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.D_OFF~q\,
	datab => \current_state.LCD_CLR~q\,
	datac => \Selector7~6_combout\,
	datad => \current_state.L2~q\,
	combout => \Selector20~0_combout\);

-- Location: LCCOMB_X62_Y69_N2
\Selector20~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~1_combout\ = (\current_state.L1~q\) # (((!\Selector20~0_combout\ & !\LessThan1~0_combout\)) # (!\Selector17~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L1~q\,
	datab => \Selector20~0_combout\,
	datac => \LessThan1~0_combout\,
	datad => \Selector17~0_combout\,
	combout => \Selector20~1_combout\);

-- Location: LCCOMB_X62_Y69_N0
\Selector20~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~2_combout\ = (\current_state.L1~q\ & ((\LessThan1~0_combout\) # ((\next_state.ASK1~q\ & \Selector20~1_combout\)))) # (!\current_state.L1~q\ & (\next_state.ASK1~q\ & ((\Selector20~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L1~q\,
	datab => \next_state.ASK1~q\,
	datac => \LessThan1~0_combout\,
	datad => \Selector20~1_combout\,
	combout => \Selector20~2_combout\);

-- Location: LCCOMB_X62_Y69_N14
\next_state.ASK1~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.ASK1~feeder_combout\ = \Selector20~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector20~2_combout\,
	combout => \next_state.ASK1~feeder_combout\);

-- Location: FF_X62_Y69_N15
\next_state.ASK1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \next_state.ASK1~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.ASK1~q\);

-- Location: FF_X62_Y69_N19
\current_state.ASK1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.ASK1~q\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.ASK1~q\);

-- Location: LCCOMB_X67_Y69_N26
WideOr2 : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr2~combout\ = (\current_state.ASK1~q\) # ((\current_state.ASK3~q\) # (\current_state.ASK2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.ASK1~q\,
	datab => \current_state.ASK3~q\,
	datac => \current_state.ASK2~q\,
	combout => \WideOr2~combout\);

-- Location: LCCOMB_X67_Y69_N14
\Selector16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~1_combout\ = (!\current_state.LCD_INI~q\ & \LCD:contador[2]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.LCD_INI~q\,
	datac => \LCD:contador[2]~q\,
	combout => \Selector16~1_combout\);

-- Location: LCCOMB_X67_Y69_N4
\Selector16~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~2_combout\ = (\LessThan1~0_combout\ & (\current_state.LCD_INI~q\ & ((!\LessThan2~0_combout\) # (!\current_state.MESG1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG1~q\,
	datab => \LessThan1~0_combout\,
	datac => \current_state.LCD_INI~q\,
	datad => \LessThan2~0_combout\,
	combout => \Selector16~2_combout\);

-- Location: LCCOMB_X67_Y69_N6
\Selector16~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~3_combout\ = (\Selector16~2_combout\) # (((!\current_state.LCD_INI~q\ & \LCD:contador[2]~q\)) # (!\Selector16~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.LCD_INI~q\,
	datab => \LCD:contador[2]~q\,
	datac => \Selector16~2_combout\,
	datad => \Selector16~0_combout\,
	combout => \Selector16~3_combout\);

-- Location: LCCOMB_X67_Y69_N16
\Selector16~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~4_combout\ = (\WideOr2~combout\ & (\next_state.D_OFF~q\ & ((!\Selector16~3_combout\)))) # (!\WideOr2~combout\ & ((\Selector16~1_combout\) # ((\next_state.D_OFF~q\ & !\Selector16~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr2~combout\,
	datab => \next_state.D_OFF~q\,
	datac => \Selector16~1_combout\,
	datad => \Selector16~3_combout\,
	combout => \Selector16~4_combout\);

-- Location: LCCOMB_X63_Y69_N26
\next_state.D_OFF~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.D_OFF~feeder_combout\ = \Selector16~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector16~4_combout\,
	combout => \next_state.D_OFF~feeder_combout\);

-- Location: FF_X63_Y69_N27
\next_state.D_OFF\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \next_state.D_OFF~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.D_OFF~q\);

-- Location: FF_X63_Y69_N7
\current_state.D_OFF\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.D_OFF~q\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.D_OFF~q\);

-- Location: LCCOMB_X63_Y69_N24
\E~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \E~0_combout\ = (!\current_state.D_OFF~q\ & (\Selector7~6_combout\ & (!\current_state.L1~q\ & !\current_state.LCD_CLR~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.D_OFF~q\,
	datab => \Selector7~6_combout\,
	datac => \current_state.L1~q\,
	datad => \current_state.LCD_CLR~q\,
	combout => \E~0_combout\);

-- Location: LCCOMB_X67_Y69_N10
\E~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \E~3_combout\ = (!\current_state.L2~q\ & \E~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.L2~q\,
	datac => \E~0_combout\,
	combout => \E~3_combout\);

-- Location: LCCOMB_X66_Y69_N12
\Selector21~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~2_combout\ = (\current_state.LCD_INI~q\ & (((\LCD:contador2[3]~2_combout\) # (!\current_state.MESG2~q\)))) # (!\current_state.LCD_INI~q\ & (\LCD:contador[2]~q\ & ((\LCD:contador2[3]~2_combout\) # (!\current_state.MESG2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.LCD_INI~q\,
	datab => \LCD:contador[2]~q\,
	datac => \current_state.MESG2~q\,
	datad => \LCD:contador2[3]~2_combout\,
	combout => \Selector21~2_combout\);

-- Location: LCCOMB_X66_Y69_N16
\Selector26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~0_combout\ = ((!\LessThan1~0_combout\ & ((\current_state.MESG1~q\) # (!\E~3_combout\)))) # (!\Selector21~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG1~q\,
	datab => \LessThan1~0_combout\,
	datac => \E~3_combout\,
	datad => \Selector21~2_combout\,
	combout => \Selector26~0_combout\);

-- Location: LCCOMB_X66_Y69_N14
\Selector26~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~1_combout\ = (\current_state.MESG1~q\ & ((\LessThan2~0_combout\) # ((\next_state.L2~q\ & \Selector26~0_combout\)))) # (!\current_state.MESG1~q\ & (((\next_state.L2~q\ & \Selector26~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG1~q\,
	datab => \LessThan2~0_combout\,
	datac => \next_state.L2~q\,
	datad => \Selector26~0_combout\,
	combout => \Selector26~1_combout\);

-- Location: FF_X66_Y69_N5
\next_state.L2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	asdata => \Selector26~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.L2~q\);

-- Location: FF_X66_Y69_N7
\current_state.L2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.L2~q\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.L2~q\);

-- Location: LCCOMB_X66_Y69_N22
\Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector23~0_combout\ = (\current_state.L2~q\) # (((!\LessThan1~0_combout\ & !\E~0_combout\)) # (!\Selector17~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L2~q\,
	datab => \LessThan1~0_combout\,
	datac => \Selector17~0_combout\,
	datad => \E~0_combout\,
	combout => \Selector23~0_combout\);

-- Location: LCCOMB_X62_Y69_N6
\Selector23~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector23~1_combout\ = (\current_state.L2~q\ & ((\LessThan1~0_combout\) # ((\next_state.ASK2~q\ & \Selector23~0_combout\)))) # (!\current_state.L2~q\ & (\next_state.ASK2~q\ & ((\Selector23~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L2~q\,
	datab => \next_state.ASK2~q\,
	datac => \LessThan1~0_combout\,
	datad => \Selector23~0_combout\,
	combout => \Selector23~1_combout\);

-- Location: LCCOMB_X62_Y69_N4
\next_state.ASK2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.ASK2~feeder_combout\ = \Selector23~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector23~1_combout\,
	combout => \next_state.ASK2~feeder_combout\);

-- Location: FF_X62_Y69_N5
\next_state.ASK2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \next_state.ASK2~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.ASK2~q\);

-- Location: LCCOMB_X62_Y69_N16
\current_state.ASK2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_state.ASK2~feeder_combout\ = \next_state.ASK2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \next_state.ASK2~q\,
	combout => \current_state.ASK2~feeder_combout\);

-- Location: FF_X62_Y69_N17
\current_state.ASK2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \current_state.ASK2~feeder_combout\,
	clrn => \Reset~inputclkctrl_outclk\,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.ASK2~q\);

-- Location: LCCOMB_X66_Y69_N20
\Selector21~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~5_combout\ = (!\LCD:contador[1]~q\ & (!\LCD:contador[2]~q\ & ((\current_state.L2~q\) # (!\E~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L2~q\,
	datab => \E~0_combout\,
	datac => \LCD:contador[1]~q\,
	datad => \LCD:contador[2]~q\,
	combout => \Selector21~5_combout\);

-- Location: LCCOMB_X66_Y69_N24
\Selector22~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector22~2_combout\ = (\next_state.MESG2~q\ & ((\Selector21~5_combout\) # ((\Selector22~0_combout\) # (!\Selector22~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector21~5_combout\,
	datab => \next_state.MESG2~q\,
	datac => \Selector22~0_combout\,
	datad => \Selector22~1_combout\,
	combout => \Selector22~2_combout\);

-- Location: LCCOMB_X66_Y69_N30
\Selector22~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector22~3_combout\ = (\current_state.ASK2~q\) # ((\Selector22~2_combout\) # ((\Selector22~0_combout\ & \LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector22~0_combout\,
	datab => \LessThan1~0_combout\,
	datac => \current_state.ASK2~q\,
	datad => \Selector22~2_combout\,
	combout => \Selector22~3_combout\);

-- Location: FF_X66_Y69_N31
\next_state.MESG2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector22~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.MESG2~q\);

-- Location: FF_X66_Y69_N13
\current_state.MESG2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.MESG2~q\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.MESG2~q\);

-- Location: LCCOMB_X66_Y69_N28
\Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = (!\WideOr2~combout\ & (((!\current_state.MESG2~q\ & !\current_state.MESG1~q\)) # (!\LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG2~q\,
	datab => \WideOr2~combout\,
	datac => \current_state.MESG1~q\,
	datad => \LessThan2~0_combout\,
	combout => \Selector16~0_combout\);

-- Location: LCCOMB_X66_Y69_N2
\next_state.LCD_INI~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \next_state.LCD_INI~0_combout\ = (\next_state.LCD_INI~q\) # (((\Selector16~1_combout\) # (\Selector16~2_combout\)) # (!\Selector16~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.LCD_INI~q\,
	datab => \Selector16~0_combout\,
	datac => \Selector16~1_combout\,
	datad => \Selector16~2_combout\,
	combout => \next_state.LCD_INI~0_combout\);

-- Location: LCCOMB_X62_Y69_N8
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

-- Location: FF_X62_Y69_N9
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

-- Location: FF_X62_Y69_N25
\current_state.LCD_INI\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.LCD_INI~q\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.LCD_INI~q\);

-- Location: LCCOMB_X67_Y69_N22
\Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = (!\current_state.LCD_INI~q\ & (\LCD:contador[0]~q\ & (!\LCD:contador[2]~q\ & \LCD:contador[1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.LCD_INI~q\,
	datab => \LCD:contador[0]~q\,
	datac => \LCD:contador[2]~q\,
	datad => \LCD:contador[1]~q\,
	combout => \Selector12~0_combout\);

-- Location: FF_X67_Y69_N23
\LCD:contador[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector12~0_combout\,
	ena => \LCD:contador[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:contador[2]~q\);

-- Location: LCCOMB_X67_Y69_N28
\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (\LCD:contador[2]~q\) # (\LCD:contador[1]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LCD:contador[2]~q\,
	datad => \LCD:contador[1]~q\,
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X62_Y69_N24
\LCD:numMen~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:numMen~1_combout\ = (\current_state.MESG1~q\ & !\LessThan2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG1~q\,
	datad => \LessThan2~0_combout\,
	combout => \LCD:numMen~1_combout\);

-- Location: LCCOMB_X62_Y69_N10
\Selector21~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~3_combout\ = (\next_state.MESG1~q\ & ((\Selector21~5_combout\) # ((\LCD:numMen~1_combout\) # (!\Selector21~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector21~5_combout\,
	datab => \Selector21~2_combout\,
	datac => \next_state.MESG1~q\,
	datad => \LCD:numMen~1_combout\,
	combout => \Selector21~3_combout\);

-- Location: LCCOMB_X62_Y69_N26
\Selector21~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~4_combout\ = (\current_state.ASK1~q\) # ((\Selector21~3_combout\) # ((\LessThan1~0_combout\ & \LCD:numMen~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \LCD:numMen~1_combout\,
	datac => \current_state.ASK1~q\,
	datad => \Selector21~3_combout\,
	combout => \Selector21~4_combout\);

-- Location: FF_X62_Y69_N27
\next_state.MESG1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector21~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.MESG1~q\);

-- Location: FF_X62_Y69_N11
\current_state.MESG1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.MESG1~q\,
	clrn => \Reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \LessThan3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.MESG1~q\);

-- Location: LCCOMB_X67_Y69_N20
\Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (\Datos[0]~reg0_q\ & ((\WideOr2~combout\) # ((\LessThan2~0_combout\ & \current_state.MESG2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr2~combout\,
	datab => \Datos[0]~reg0_q\,
	datac => \LessThan2~0_combout\,
	datad => \current_state.MESG2~q\,
	combout => \Selector8~0_combout\);

-- Location: LCCOMB_X67_Y68_N28
\Mux19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux19~0_combout\ = (\LCD:contador2[1]~q\ & (((\LCD:contador2[0]~q\) # (\Data_In[3]~input_o\)))) # (!\LCD:contador2[1]~q\ & (\Data_In[5]~input_o\ & (!\LCD:contador2[0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[1]~q\,
	datab => \Data_In[5]~input_o\,
	datac => \LCD:contador2[0]~q\,
	datad => \Data_In[3]~input_o\,
	combout => \Mux19~0_combout\);

-- Location: LCCOMB_X67_Y68_N30
\Mux19~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux19~1_combout\ = (\LCD:contador2[0]~q\ & ((\Mux19~0_combout\ & (\Data_In[2]~input_o\)) # (!\Mux19~0_combout\ & ((\Data_In[4]~input_o\))))) # (!\LCD:contador2[0]~q\ & (((\Mux19~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[2]~input_o\,
	datab => \Data_In[4]~input_o\,
	datac => \LCD:contador2[0]~q\,
	datad => \Mux19~0_combout\,
	combout => \Mux19~1_combout\);

-- Location: LCCOMB_X66_Y68_N16
\LCD:numMen~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LCD:numMen~0_combout\ = \LCD:numMen~q\ $ (((\current_state.MESG1~q\ & (!\LessThan2~0_combout\ & \LessThan1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG1~q\,
	datab => \LessThan2~0_combout\,
	datac => \LCD:numMen~q\,
	datad => \LessThan1~0_combout\,
	combout => \LCD:numMen~0_combout\);

-- Location: FF_X66_Y68_N17
\LCD:numMen\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \LCD:numMen~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LCD:numMen~q\);

-- Location: LCCOMB_X67_Y68_N12
\Datos~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Datos~0_combout\ = (\LCD:contador2[0]~q\ & ((\Data_In[0]~input_o\) # ((!\LCD:contador2[3]~q\)))) # (!\LCD:contador2[0]~q\ & (((\Data_In[1]~input_o\ & \LCD:contador2[3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[0]~input_o\,
	datab => \Data_In[1]~input_o\,
	datac => \LCD:contador2[0]~q\,
	datad => \LCD:contador2[3]~q\,
	combout => \Datos~0_combout\);

-- Location: LCCOMB_X67_Y68_N10
\Datos~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Datos~1_combout\ = (\LCD:contador2[1]~q\ & ((\Datos~0_combout\ & ((\Data_In[6]~input_o\))) # (!\Datos~0_combout\ & (\Data_In[7]~input_o\)))) # (!\LCD:contador2[1]~q\ & (((\Datos~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data_In[7]~input_o\,
	datab => \Data_In[6]~input_o\,
	datac => \LCD:contador2[1]~q\,
	datad => \Datos~0_combout\,
	combout => \Datos~1_combout\);

-- Location: LCCOMB_X67_Y68_N20
\Datos~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Datos~2_combout\ = (\LCD:contador2[1]~q\ & (!\LCD:contador2[3]~q\ & ((\Datos~1_combout\)))) # (!\LCD:contador2[1]~q\ & ((\Datos~1_combout\) # ((!\LCD:contador2[3]~q\ & !\LCD:numMen~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[1]~q\,
	datab => \LCD:contador2[3]~q\,
	datac => \LCD:numMen~q\,
	datad => \Datos~1_combout\,
	combout => \Datos~2_combout\);

-- Location: LCCOMB_X67_Y68_N0
\Datos~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Datos~3_combout\ = (\LCD:contador2[2]~q\ & (!\LCD:contador2[3]~q\ & (\Mux19~1_combout\))) # (!\LCD:contador2[2]~q\ & (((\Datos~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[3]~q\,
	datac => \Mux19~1_combout\,
	datad => \Datos~2_combout\,
	combout => \Datos~3_combout\);

-- Location: LCCOMB_X66_Y67_N26
\Datos~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Datos~4_combout\ = (\Datos~3_combout\) # ((\Datos[0]~reg0_q\ & \LessThan2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Datos[0]~reg0_q\,
	datac => \LessThan2~0_combout\,
	datad => \Datos~3_combout\,
	combout => \Datos~4_combout\);

-- Location: IOIBUF_X65_Y73_N8
\PUSH_barPOP~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PUSH_barPOP,
	o => \PUSH_barPOP~input_o\);

-- Location: IOIBUF_X58_Y73_N8
\Enable~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Enable,
	o => \Enable~input_o\);

-- Location: LCCOMB_X66_Y61_N30
\pila~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila~0_combout\ = (!\PUSH_barPOP~input_o\ & (\Enable~input_o\ & !\empty~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PUSH_barPOP~input_o\,
	datac => \Enable~input_o\,
	datad => \empty~q\,
	combout => \pila~0_combout\);

-- Location: LCCOMB_X65_Y63_N4
\pila~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila~4_combout\ = (\Enable~input_o\ & \PUSH_barPOP~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Enable~input_o\,
	datad => \PUSH_barPOP~input_o\,
	combout => \pila~4_combout\);

-- Location: FF_X65_Y63_N5
prev_PP : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila~4_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \prev_PP~q\);

-- Location: LCCOMB_X65_Y63_N6
\pila~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila~2_combout\ = (\prev_PP~q\ & !\full~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \prev_PP~q\,
	datad => \full~q\,
	combout => \pila~2_combout\);

-- Location: LCCOMB_X66_Y59_N0
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\pila:stack_ptr[0]~q\ & (\pila~2_combout\ $ (VCC))) # (!\pila:stack_ptr[0]~q\ & (\pila~2_combout\ & VCC))
-- \Add0~1\ = CARRY((\pila:stack_ptr[0]~q\ & \pila~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[0]~q\,
	datab => \pila~2_combout\,
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X65_Y59_N0
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = \Add0~0_combout\ $ (VCC)
-- \Add1~1\ = CARRY(\Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~0_combout\,
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X65_Y59_N2
\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\Add0~2_combout\ & (!\Add1~1\)) # (!\Add0~2_combout\ & ((\Add1~1\) # (GND)))
-- \Add1~3\ = CARRY((!\Add1~1\) # (!\Add0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~2_combout\,
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X65_Y59_N4
\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (\Add0~4_combout\ & (\Add1~3\ $ (GND))) # (!\Add0~4_combout\ & (!\Add1~3\ & VCC))
-- \Add1~5\ = CARRY((\Add0~4_combout\ & !\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X65_Y59_N6
\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (\Add0~6_combout\ & (!\Add1~5\)) # (!\Add0~6_combout\ & ((\Add1~5\) # (GND)))
-- \Add1~7\ = CARRY((!\Add1~5\) # (!\Add0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~6_combout\,
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X65_Y59_N8
\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (\Add0~8_combout\ & (\Add1~7\ $ (GND))) # (!\Add0~8_combout\ & (!\Add1~7\ & VCC))
-- \Add1~9\ = CARRY((\Add0~8_combout\ & !\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~8_combout\,
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X65_Y59_N10
\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (\Add0~10_combout\ & (!\Add1~9\)) # (!\Add0~10_combout\ & ((\Add1~9\) # (GND)))
-- \Add1~11\ = CARRY((!\Add1~9\) # (!\Add0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~10_combout\,
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X65_Y59_N12
\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (\Add0~12_combout\ & (\Add1~11\ $ (GND))) # (!\Add0~12_combout\ & (!\Add1~11\ & VCC))
-- \Add1~13\ = CARRY((\Add0~12_combout\ & !\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~12_combout\,
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X65_Y59_N14
\Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (\Add0~14_combout\ & (!\Add1~13\)) # (!\Add0~14_combout\ & ((\Add1~13\) # (GND)))
-- \Add1~15\ = CARRY((!\Add1~13\) # (!\Add0~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~14_combout\,
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: LCCOMB_X67_Y59_N28
\pila:stack_ptr[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[7]~0_combout\ = (\pila~0_combout\ & ((\Add1~14_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[7]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila~0_combout\,
	datac => \pila:stack_ptr[7]~q\,
	datad => \Add1~14_combout\,
	combout => \pila:stack_ptr[7]~0_combout\);

-- Location: LCCOMB_X65_Y63_N28
\pila~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila~3_combout\ = (\prev_PP~q\) # (\empty~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \prev_PP~q\,
	datad => \empty~q\,
	combout => \pila~3_combout\);

-- Location: LCCOMB_X68_Y61_N0
\Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = (\pila~3_combout\ & (\pila:stack_ptr[0]~0_combout\ & VCC)) # (!\pila~3_combout\ & (\pila:stack_ptr[0]~0_combout\ $ (VCC)))
-- \Add2~1\ = CARRY((!\pila~3_combout\ & \pila:stack_ptr[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[0]~0_combout\,
	datad => VCC,
	combout => \Add2~0_combout\,
	cout => \Add2~1\);

-- Location: LCCOMB_X68_Y61_N2
\Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (\pila~3_combout\ & ((\pila:stack_ptr[1]~0_combout\ & (!\Add2~1\)) # (!\pila:stack_ptr[1]~0_combout\ & ((\Add2~1\) # (GND))))) # (!\pila~3_combout\ & ((\pila:stack_ptr[1]~0_combout\ & (\Add2~1\ & VCC)) # (!\pila:stack_ptr[1]~0_combout\ 
-- & (!\Add2~1\))))
-- \Add2~3\ = CARRY((\pila~3_combout\ & ((!\Add2~1\) # (!\pila:stack_ptr[1]~0_combout\))) # (!\pila~3_combout\ & (!\pila:stack_ptr[1]~0_combout\ & !\Add2~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[1]~0_combout\,
	datad => VCC,
	cin => \Add2~1\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

-- Location: LCCOMB_X68_Y61_N4
\Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = ((\pila~3_combout\ $ (\stack_ptr~5_combout\ $ (\Add2~3\)))) # (GND)
-- \Add2~5\ = CARRY((\pila~3_combout\ & (\stack_ptr~5_combout\ & !\Add2~3\)) # (!\pila~3_combout\ & ((\stack_ptr~5_combout\) # (!\Add2~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \stack_ptr~5_combout\,
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

-- Location: LCCOMB_X68_Y61_N6
\Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = (\pila~3_combout\ & ((\pila:stack_ptr[3]~0_combout\ & (!\Add2~5\)) # (!\pila:stack_ptr[3]~0_combout\ & ((\Add2~5\) # (GND))))) # (!\pila~3_combout\ & ((\pila:stack_ptr[3]~0_combout\ & (\Add2~5\ & VCC)) # (!\pila:stack_ptr[3]~0_combout\ 
-- & (!\Add2~5\))))
-- \Add2~7\ = CARRY((\pila~3_combout\ & ((!\Add2~5\) # (!\pila:stack_ptr[3]~0_combout\))) # (!\pila~3_combout\ & (!\pila:stack_ptr[3]~0_combout\ & !\Add2~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[3]~0_combout\,
	datad => VCC,
	cin => \Add2~5\,
	combout => \Add2~6_combout\,
	cout => \Add2~7\);

-- Location: LCCOMB_X68_Y61_N8
\Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~8_combout\ = ((\pila~3_combout\ $ (\pila:stack_ptr[4]~0_combout\ $ (\Add2~7\)))) # (GND)
-- \Add2~9\ = CARRY((\pila~3_combout\ & (\pila:stack_ptr[4]~0_combout\ & !\Add2~7\)) # (!\pila~3_combout\ & ((\pila:stack_ptr[4]~0_combout\) # (!\Add2~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[4]~0_combout\,
	datad => VCC,
	cin => \Add2~7\,
	combout => \Add2~8_combout\,
	cout => \Add2~9\);

-- Location: LCCOMB_X68_Y61_N10
\Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~10_combout\ = (\pila~3_combout\ & ((\stack_ptr~6_combout\ & (!\Add2~9\)) # (!\stack_ptr~6_combout\ & ((\Add2~9\) # (GND))))) # (!\pila~3_combout\ & ((\stack_ptr~6_combout\ & (\Add2~9\ & VCC)) # (!\stack_ptr~6_combout\ & (!\Add2~9\))))
-- \Add2~11\ = CARRY((\pila~3_combout\ & ((!\Add2~9\) # (!\stack_ptr~6_combout\))) # (!\pila~3_combout\ & (!\stack_ptr~6_combout\ & !\Add2~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \stack_ptr~6_combout\,
	datad => VCC,
	cin => \Add2~9\,
	combout => \Add2~10_combout\,
	cout => \Add2~11\);

-- Location: LCCOMB_X68_Y61_N12
\Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~12_combout\ = ((\pila~3_combout\ $ (\stack_ptr~7_combout\ $ (\Add2~11\)))) # (GND)
-- \Add2~13\ = CARRY((\pila~3_combout\ & (\stack_ptr~7_combout\ & !\Add2~11\)) # (!\pila~3_combout\ & ((\stack_ptr~7_combout\) # (!\Add2~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \stack_ptr~7_combout\,
	datad => VCC,
	cin => \Add2~11\,
	combout => \Add2~12_combout\,
	cout => \Add2~13\);

-- Location: LCCOMB_X68_Y61_N14
\Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~14_combout\ = (\pila:stack_ptr[7]~0_combout\ & ((\pila~3_combout\ & (!\Add2~13\)) # (!\pila~3_combout\ & (\Add2~13\ & VCC)))) # (!\pila:stack_ptr[7]~0_combout\ & ((\pila~3_combout\ & ((\Add2~13\) # (GND))) # (!\pila~3_combout\ & (!\Add2~13\))))
-- \Add2~15\ = CARRY((\pila:stack_ptr[7]~0_combout\ & (\pila~3_combout\ & !\Add2~13\)) # (!\pila:stack_ptr[7]~0_combout\ & ((\pila~3_combout\) # (!\Add2~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[7]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~13\,
	combout => \Add2~14_combout\,
	cout => \Add2~15\);

-- Location: LCCOMB_X69_Y61_N0
\Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = \Add2~0_combout\ $ (VCC)
-- \Add3~1\ = CARRY(\Add2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~0_combout\,
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: LCCOMB_X69_Y61_N2
\Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (\Add2~2_combout\ & (\Add3~1\ & VCC)) # (!\Add2~2_combout\ & (!\Add3~1\))
-- \Add3~3\ = CARRY((!\Add2~2_combout\ & !\Add3~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~2_combout\,
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X69_Y61_N4
\Add3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = (\Add2~4_combout\ & ((GND) # (!\Add3~3\))) # (!\Add2~4_combout\ & (\Add3~3\ $ (GND)))
-- \Add3~5\ = CARRY((\Add2~4_combout\) # (!\Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~4_combout\,
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: LCCOMB_X69_Y61_N6
\Add3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (\Add2~6_combout\ & (\Add3~5\ & VCC)) # (!\Add2~6_combout\ & (!\Add3~5\))
-- \Add3~7\ = CARRY((!\Add2~6_combout\ & !\Add3~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~6_combout\,
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: LCCOMB_X69_Y61_N8
\Add3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = (\Add2~8_combout\ & ((GND) # (!\Add3~7\))) # (!\Add2~8_combout\ & (\Add3~7\ $ (GND)))
-- \Add3~9\ = CARRY((\Add2~8_combout\) # (!\Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~8_combout\,
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: LCCOMB_X69_Y61_N10
\Add3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = (\Add2~10_combout\ & (\Add3~9\ & VCC)) # (!\Add2~10_combout\ & (!\Add3~9\))
-- \Add3~11\ = CARRY((!\Add2~10_combout\ & !\Add3~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~10_combout\,
	datad => VCC,
	cin => \Add3~9\,
	combout => \Add3~10_combout\,
	cout => \Add3~11\);

-- Location: LCCOMB_X69_Y61_N12
\Add3~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~14_combout\ = (\Add2~12_combout\ & ((GND) # (!\Add3~11\))) # (!\Add2~12_combout\ & (\Add3~11\ $ (GND)))
-- \Add3~15\ = CARRY((\Add2~12_combout\) # (!\Add3~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~12_combout\,
	datad => VCC,
	cin => \Add3~11\,
	combout => \Add3~14_combout\,
	cout => \Add3~15\);

-- Location: LCCOMB_X69_Y61_N14
\Add3~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~16_combout\ = (\Add2~14_combout\ & (\Add3~15\ & VCC)) # (!\Add2~14_combout\ & (!\Add3~15\))
-- \Add3~17\ = CARRY((!\Add2~14_combout\ & !\Add3~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~14_combout\,
	datad => VCC,
	cin => \Add3~15\,
	combout => \Add3~16_combout\,
	cout => \Add3~17\);

-- Location: LCCOMB_X68_Y61_N16
\Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~16_combout\ = ((\pila~3_combout\ $ (\pila:stack_ptr[8]~0_combout\ $ (\Add2~15\)))) # (GND)
-- \Add2~17\ = CARRY((\pila~3_combout\ & (\pila:stack_ptr[8]~0_combout\ & !\Add2~15\)) # (!\pila~3_combout\ & ((\pila:stack_ptr[8]~0_combout\) # (!\Add2~15\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[8]~0_combout\,
	datad => VCC,
	cin => \Add2~15\,
	combout => \Add2~16_combout\,
	cout => \Add2~17\);

-- Location: LCCOMB_X68_Y61_N18
\Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~18_combout\ = (\pila:stack_ptr[9]~0_combout\ & ((\pila~3_combout\ & (!\Add2~17\)) # (!\pila~3_combout\ & (\Add2~17\ & VCC)))) # (!\pila:stack_ptr[9]~0_combout\ & ((\pila~3_combout\ & ((\Add2~17\) # (GND))) # (!\pila~3_combout\ & (!\Add2~17\))))
-- \Add2~19\ = CARRY((\pila:stack_ptr[9]~0_combout\ & (\pila~3_combout\ & !\Add2~17\)) # (!\pila:stack_ptr[9]~0_combout\ & ((\pila~3_combout\) # (!\Add2~17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[9]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~17\,
	combout => \Add2~18_combout\,
	cout => \Add2~19\);

-- Location: LCCOMB_X68_Y61_N20
\Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~20_combout\ = ((\pila:stack_ptr[10]~0_combout\ $ (\pila~3_combout\ $ (\Add2~19\)))) # (GND)
-- \Add2~21\ = CARRY((\pila:stack_ptr[10]~0_combout\ & ((!\Add2~19\) # (!\pila~3_combout\))) # (!\pila:stack_ptr[10]~0_combout\ & (!\pila~3_combout\ & !\Add2~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[10]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~19\,
	combout => \Add2~20_combout\,
	cout => \Add2~21\);

-- Location: LCCOMB_X68_Y61_N22
\Add2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~22_combout\ = (\pila:stack_ptr[11]~0_combout\ & ((\pila~3_combout\ & (!\Add2~21\)) # (!\pila~3_combout\ & (\Add2~21\ & VCC)))) # (!\pila:stack_ptr[11]~0_combout\ & ((\pila~3_combout\ & ((\Add2~21\) # (GND))) # (!\pila~3_combout\ & (!\Add2~21\))))
-- \Add2~23\ = CARRY((\pila:stack_ptr[11]~0_combout\ & (\pila~3_combout\ & !\Add2~21\)) # (!\pila:stack_ptr[11]~0_combout\ & ((\pila~3_combout\) # (!\Add2~21\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[11]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~21\,
	combout => \Add2~22_combout\,
	cout => \Add2~23\);

-- Location: LCCOMB_X68_Y61_N24
\Add2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~24_combout\ = ((\pila:stack_ptr[12]~0_combout\ $ (\pila~3_combout\ $ (\Add2~23\)))) # (GND)
-- \Add2~25\ = CARRY((\pila:stack_ptr[12]~0_combout\ & ((!\Add2~23\) # (!\pila~3_combout\))) # (!\pila:stack_ptr[12]~0_combout\ & (!\pila~3_combout\ & !\Add2~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[12]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~23\,
	combout => \Add2~24_combout\,
	cout => \Add2~25\);

-- Location: LCCOMB_X68_Y61_N26
\Add2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~26_combout\ = (\pila:stack_ptr[13]~0_combout\ & ((\pila~3_combout\ & (!\Add2~25\)) # (!\pila~3_combout\ & (\Add2~25\ & VCC)))) # (!\pila:stack_ptr[13]~0_combout\ & ((\pila~3_combout\ & ((\Add2~25\) # (GND))) # (!\pila~3_combout\ & (!\Add2~25\))))
-- \Add2~27\ = CARRY((\pila:stack_ptr[13]~0_combout\ & (\pila~3_combout\ & !\Add2~25\)) # (!\pila:stack_ptr[13]~0_combout\ & ((\pila~3_combout\) # (!\Add2~25\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[13]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~25\,
	combout => \Add2~26_combout\,
	cout => \Add2~27\);

-- Location: LCCOMB_X68_Y61_N28
\Add2~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~28_combout\ = ((\pila:stack_ptr[14]~0_combout\ $ (\pila~3_combout\ $ (\Add2~27\)))) # (GND)
-- \Add2~29\ = CARRY((\pila:stack_ptr[14]~0_combout\ & ((!\Add2~27\) # (!\pila~3_combout\))) # (!\pila:stack_ptr[14]~0_combout\ & (!\pila~3_combout\ & !\Add2~27\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[14]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~27\,
	combout => \Add2~28_combout\,
	cout => \Add2~29\);

-- Location: LCCOMB_X68_Y61_N30
\Add2~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~30_combout\ = (\pila:stack_ptr[15]~0_combout\ & ((\pila~3_combout\ & (!\Add2~29\)) # (!\pila~3_combout\ & (\Add2~29\ & VCC)))) # (!\pila:stack_ptr[15]~0_combout\ & ((\pila~3_combout\ & ((\Add2~29\) # (GND))) # (!\pila~3_combout\ & (!\Add2~29\))))
-- \Add2~31\ = CARRY((\pila:stack_ptr[15]~0_combout\ & (\pila~3_combout\ & !\Add2~29\)) # (!\pila:stack_ptr[15]~0_combout\ & ((\pila~3_combout\) # (!\Add2~29\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[15]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~29\,
	combout => \Add2~30_combout\,
	cout => \Add2~31\);

-- Location: LCCOMB_X68_Y60_N0
\Add2~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~32_combout\ = ((\pila~3_combout\ $ (\pila:stack_ptr[16]~0_combout\ $ (\Add2~31\)))) # (GND)
-- \Add2~33\ = CARRY((\pila~3_combout\ & (\pila:stack_ptr[16]~0_combout\ & !\Add2~31\)) # (!\pila~3_combout\ & ((\pila:stack_ptr[16]~0_combout\) # (!\Add2~31\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[16]~0_combout\,
	datad => VCC,
	cin => \Add2~31\,
	combout => \Add2~32_combout\,
	cout => \Add2~33\);

-- Location: LCCOMB_X68_Y60_N2
\Add2~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~34_combout\ = (\pila~3_combout\ & ((\pila:stack_ptr[17]~0_combout\ & (!\Add2~33\)) # (!\pila:stack_ptr[17]~0_combout\ & ((\Add2~33\) # (GND))))) # (!\pila~3_combout\ & ((\pila:stack_ptr[17]~0_combout\ & (\Add2~33\ & VCC)) # 
-- (!\pila:stack_ptr[17]~0_combout\ & (!\Add2~33\))))
-- \Add2~35\ = CARRY((\pila~3_combout\ & ((!\Add2~33\) # (!\pila:stack_ptr[17]~0_combout\))) # (!\pila~3_combout\ & (!\pila:stack_ptr[17]~0_combout\ & !\Add2~33\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[17]~0_combout\,
	datad => VCC,
	cin => \Add2~33\,
	combout => \Add2~34_combout\,
	cout => \Add2~35\);

-- Location: LCCOMB_X68_Y60_N4
\Add2~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~36_combout\ = ((\pila~3_combout\ $ (\pila:stack_ptr[18]~0_combout\ $ (\Add2~35\)))) # (GND)
-- \Add2~37\ = CARRY((\pila~3_combout\ & (\pila:stack_ptr[18]~0_combout\ & !\Add2~35\)) # (!\pila~3_combout\ & ((\pila:stack_ptr[18]~0_combout\) # (!\Add2~35\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[18]~0_combout\,
	datad => VCC,
	cin => \Add2~35\,
	combout => \Add2~36_combout\,
	cout => \Add2~37\);

-- Location: LCCOMB_X68_Y60_N6
\Add2~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~38_combout\ = (\pila~3_combout\ & ((\pila:stack_ptr[19]~0_combout\ & (!\Add2~37\)) # (!\pila:stack_ptr[19]~0_combout\ & ((\Add2~37\) # (GND))))) # (!\pila~3_combout\ & ((\pila:stack_ptr[19]~0_combout\ & (\Add2~37\ & VCC)) # 
-- (!\pila:stack_ptr[19]~0_combout\ & (!\Add2~37\))))
-- \Add2~39\ = CARRY((\pila~3_combout\ & ((!\Add2~37\) # (!\pila:stack_ptr[19]~0_combout\))) # (!\pila~3_combout\ & (!\pila:stack_ptr[19]~0_combout\ & !\Add2~37\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[19]~0_combout\,
	datad => VCC,
	cin => \Add2~37\,
	combout => \Add2~38_combout\,
	cout => \Add2~39\);

-- Location: LCCOMB_X68_Y60_N8
\Add2~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~40_combout\ = ((\pila~3_combout\ $ (\pila:stack_ptr[20]~0_combout\ $ (\Add2~39\)))) # (GND)
-- \Add2~41\ = CARRY((\pila~3_combout\ & (\pila:stack_ptr[20]~0_combout\ & !\Add2~39\)) # (!\pila~3_combout\ & ((\pila:stack_ptr[20]~0_combout\) # (!\Add2~39\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[20]~0_combout\,
	datad => VCC,
	cin => \Add2~39\,
	combout => \Add2~40_combout\,
	cout => \Add2~41\);

-- Location: LCCOMB_X68_Y60_N10
\Add2~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~42_combout\ = (\pila~3_combout\ & ((\pila:stack_ptr[21]~0_combout\ & (!\Add2~41\)) # (!\pila:stack_ptr[21]~0_combout\ & ((\Add2~41\) # (GND))))) # (!\pila~3_combout\ & ((\pila:stack_ptr[21]~0_combout\ & (\Add2~41\ & VCC)) # 
-- (!\pila:stack_ptr[21]~0_combout\ & (!\Add2~41\))))
-- \Add2~43\ = CARRY((\pila~3_combout\ & ((!\Add2~41\) # (!\pila:stack_ptr[21]~0_combout\))) # (!\pila~3_combout\ & (!\pila:stack_ptr[21]~0_combout\ & !\Add2~41\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[21]~0_combout\,
	datad => VCC,
	cin => \Add2~41\,
	combout => \Add2~42_combout\,
	cout => \Add2~43\);

-- Location: LCCOMB_X68_Y60_N12
\Add2~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~44_combout\ = ((\pila~3_combout\ $ (\pila:stack_ptr[22]~0_combout\ $ (\Add2~43\)))) # (GND)
-- \Add2~45\ = CARRY((\pila~3_combout\ & (\pila:stack_ptr[22]~0_combout\ & !\Add2~43\)) # (!\pila~3_combout\ & ((\pila:stack_ptr[22]~0_combout\) # (!\Add2~43\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[22]~0_combout\,
	datad => VCC,
	cin => \Add2~43\,
	combout => \Add2~44_combout\,
	cout => \Add2~45\);

-- Location: LCCOMB_X68_Y60_N14
\Add2~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~46_combout\ = (\pila:stack_ptr[23]~0_combout\ & ((\pila~3_combout\ & (!\Add2~45\)) # (!\pila~3_combout\ & (\Add2~45\ & VCC)))) # (!\pila:stack_ptr[23]~0_combout\ & ((\pila~3_combout\ & ((\Add2~45\) # (GND))) # (!\pila~3_combout\ & (!\Add2~45\))))
-- \Add2~47\ = CARRY((\pila:stack_ptr[23]~0_combout\ & (\pila~3_combout\ & !\Add2~45\)) # (!\pila:stack_ptr[23]~0_combout\ & ((\pila~3_combout\) # (!\Add2~45\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[23]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~45\,
	combout => \Add2~46_combout\,
	cout => \Add2~47\);

-- Location: LCCOMB_X68_Y60_N16
\Add2~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~48_combout\ = ((\pila~3_combout\ $ (\pila:stack_ptr[24]~0_combout\ $ (\Add2~47\)))) # (GND)
-- \Add2~49\ = CARRY((\pila~3_combout\ & (\pila:stack_ptr[24]~0_combout\ & !\Add2~47\)) # (!\pila~3_combout\ & ((\pila:stack_ptr[24]~0_combout\) # (!\Add2~47\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila~3_combout\,
	datab => \pila:stack_ptr[24]~0_combout\,
	datad => VCC,
	cin => \Add2~47\,
	combout => \Add2~48_combout\,
	cout => \Add2~49\);

-- Location: LCCOMB_X68_Y60_N18
\Add2~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~50_combout\ = (\pila:stack_ptr[25]~0_combout\ & ((\pila~3_combout\ & (!\Add2~49\)) # (!\pila~3_combout\ & (\Add2~49\ & VCC)))) # (!\pila:stack_ptr[25]~0_combout\ & ((\pila~3_combout\ & ((\Add2~49\) # (GND))) # (!\pila~3_combout\ & (!\Add2~49\))))
-- \Add2~51\ = CARRY((\pila:stack_ptr[25]~0_combout\ & (\pila~3_combout\ & !\Add2~49\)) # (!\pila:stack_ptr[25]~0_combout\ & ((\pila~3_combout\) # (!\Add2~49\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[25]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~49\,
	combout => \Add2~50_combout\,
	cout => \Add2~51\);

-- Location: LCCOMB_X68_Y60_N20
\Add2~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~52_combout\ = ((\pila:stack_ptr[26]~0_combout\ $ (\pila~3_combout\ $ (\Add2~51\)))) # (GND)
-- \Add2~53\ = CARRY((\pila:stack_ptr[26]~0_combout\ & ((!\Add2~51\) # (!\pila~3_combout\))) # (!\pila:stack_ptr[26]~0_combout\ & (!\pila~3_combout\ & !\Add2~51\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[26]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~51\,
	combout => \Add2~52_combout\,
	cout => \Add2~53\);

-- Location: LCCOMB_X68_Y60_N22
\Add2~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~54_combout\ = (\pila:stack_ptr[27]~0_combout\ & ((\pila~3_combout\ & (!\Add2~53\)) # (!\pila~3_combout\ & (\Add2~53\ & VCC)))) # (!\pila:stack_ptr[27]~0_combout\ & ((\pila~3_combout\ & ((\Add2~53\) # (GND))) # (!\pila~3_combout\ & (!\Add2~53\))))
-- \Add2~55\ = CARRY((\pila:stack_ptr[27]~0_combout\ & (\pila~3_combout\ & !\Add2~53\)) # (!\pila:stack_ptr[27]~0_combout\ & ((\pila~3_combout\) # (!\Add2~53\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[27]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~53\,
	combout => \Add2~54_combout\,
	cout => \Add2~55\);

-- Location: LCCOMB_X68_Y60_N24
\Add2~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~56_combout\ = ((\pila:stack_ptr[28]~0_combout\ $ (\pila~3_combout\ $ (\Add2~55\)))) # (GND)
-- \Add2~57\ = CARRY((\pila:stack_ptr[28]~0_combout\ & ((!\Add2~55\) # (!\pila~3_combout\))) # (!\pila:stack_ptr[28]~0_combout\ & (!\pila~3_combout\ & !\Add2~55\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[28]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~55\,
	combout => \Add2~56_combout\,
	cout => \Add2~57\);

-- Location: LCCOMB_X68_Y60_N26
\Add2~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~58_combout\ = (\pila:stack_ptr[29]~0_combout\ & ((\pila~3_combout\ & (!\Add2~57\)) # (!\pila~3_combout\ & (\Add2~57\ & VCC)))) # (!\pila:stack_ptr[29]~0_combout\ & ((\pila~3_combout\ & ((\Add2~57\) # (GND))) # (!\pila~3_combout\ & (!\Add2~57\))))
-- \Add2~59\ = CARRY((\pila:stack_ptr[29]~0_combout\ & (\pila~3_combout\ & !\Add2~57\)) # (!\pila:stack_ptr[29]~0_combout\ & ((\pila~3_combout\) # (!\Add2~57\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[29]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~57\,
	combout => \Add2~58_combout\,
	cout => \Add2~59\);

-- Location: LCCOMB_X68_Y60_N28
\Add2~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~60_combout\ = ((\pila:stack_ptr[30]~0_combout\ $ (\pila~3_combout\ $ (\Add2~59\)))) # (GND)
-- \Add2~61\ = CARRY((\pila:stack_ptr[30]~0_combout\ & ((!\Add2~59\) # (!\pila~3_combout\))) # (!\pila:stack_ptr[30]~0_combout\ & (!\pila~3_combout\ & !\Add2~59\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[30]~0_combout\,
	datab => \pila~3_combout\,
	datad => VCC,
	cin => \Add2~59\,
	combout => \Add2~60_combout\,
	cout => \Add2~61\);

-- Location: LCCOMB_X68_Y60_N30
\Add2~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~62_combout\ = \pila:stack_ptr[31]~0_combout\ $ (\pila~3_combout\ $ (!\Add2~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[31]~0_combout\,
	datab => \pila~3_combout\,
	cin => \Add2~61\,
	combout => \Add2~62_combout\);

-- Location: LCCOMB_X67_Y60_N30
\Equal3~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~9_combout\ = (!\Add2~56_combout\ & !\Add2~58_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add2~56_combout\,
	datad => \Add2~58_combout\,
	combout => \Equal3~9_combout\);

-- Location: LCCOMB_X67_Y60_N12
\Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (!\Add2~0_combout\ & (!\Add2~2_combout\ & (!\Add2~4_combout\ & !\Add2~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~0_combout\,
	datab => \Add2~2_combout\,
	datac => \Add2~4_combout\,
	datad => \Add2~6_combout\,
	combout => \Equal3~0_combout\);

-- Location: LCCOMB_X67_Y60_N14
\Equal3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~1_combout\ = (!\Add2~8_combout\ & (!\Add2~12_combout\ & (!\Add2~10_combout\ & !\Add2~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~8_combout\,
	datab => \Add2~12_combout\,
	datac => \Add2~10_combout\,
	datad => \Add2~14_combout\,
	combout => \Equal3~1_combout\);

-- Location: LCCOMB_X67_Y60_N8
\Equal3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~2_combout\ = (!\Add2~22_combout\ & (!\Add2~16_combout\ & (!\Add2~18_combout\ & !\Add2~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~22_combout\,
	datab => \Add2~16_combout\,
	datac => \Add2~18_combout\,
	datad => \Add2~20_combout\,
	combout => \Equal3~2_combout\);

-- Location: LCCOMB_X67_Y60_N10
\Equal3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~3_combout\ = (!\Add2~28_combout\ & (!\Add2~30_combout\ & (!\Add2~26_combout\ & !\Add2~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~28_combout\,
	datab => \Add2~30_combout\,
	datac => \Add2~26_combout\,
	datad => \Add2~24_combout\,
	combout => \Equal3~3_combout\);

-- Location: LCCOMB_X67_Y60_N4
\Equal3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~4_combout\ = (\Equal3~0_combout\ & (\Equal3~1_combout\ & (\Equal3~2_combout\ & \Equal3~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~0_combout\,
	datab => \Equal3~1_combout\,
	datac => \Equal3~2_combout\,
	datad => \Equal3~3_combout\,
	combout => \Equal3~4_combout\);

-- Location: LCCOMB_X67_Y60_N6
\Equal3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~5_combout\ = (!\Add2~36_combout\ & (!\Add2~32_combout\ & (!\Add2~34_combout\ & !\Add2~38_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~36_combout\,
	datab => \Add2~32_combout\,
	datac => \Add2~34_combout\,
	datad => \Add2~38_combout\,
	combout => \Equal3~5_combout\);

-- Location: LCCOMB_X67_Y60_N28
\Equal3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~6_combout\ = (!\Add2~40_combout\ & (!\Add2~42_combout\ & (!\Add2~44_combout\ & \Equal3~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~40_combout\,
	datab => \Add2~42_combout\,
	datac => \Add2~44_combout\,
	datad => \Equal3~5_combout\,
	combout => \Equal3~6_combout\);

-- Location: LCCOMB_X67_Y60_N18
\Equal3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~7_combout\ = (!\Add2~46_combout\ & (!\Add2~48_combout\ & (\Equal3~4_combout\ & \Equal3~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~46_combout\,
	datab => \Add2~48_combout\,
	datac => \Equal3~4_combout\,
	datad => \Equal3~6_combout\,
	combout => \Equal3~7_combout\);

-- Location: LCCOMB_X67_Y60_N20
\Equal3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~8_combout\ = (!\Add2~50_combout\ & (!\Add2~54_combout\ & (!\Add2~52_combout\ & \Equal3~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~50_combout\,
	datab => \Add2~54_combout\,
	datac => \Add2~52_combout\,
	datad => \Equal3~7_combout\,
	combout => \Equal3~8_combout\);

-- Location: LCCOMB_X67_Y60_N0
\Equal3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~10_combout\ = (!\Add2~62_combout\ & (!\Add2~60_combout\ & (\Equal3~9_combout\ & \Equal3~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~62_combout\,
	datab => \Add2~60_combout\,
	datac => \Equal3~9_combout\,
	datad => \Equal3~8_combout\,
	combout => \Equal3~10_combout\);

-- Location: LCCOMB_X67_Y59_N30
\Add3~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~91_combout\ = (\Add3~16_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~16_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~91_combout\);

-- Location: FF_X67_Y59_N29
\pila:stack_ptr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[7]~0_combout\,
	asdata => \Add3~91_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[7]~q\);

-- Location: LCCOMB_X66_Y59_N12
\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (\pila:stack_ptr[6]~q\ & (!\Add0~11\ & VCC)) # (!\pila:stack_ptr[6]~q\ & (\Add0~11\ $ (GND)))
-- \Add0~13\ = CARRY((!\pila:stack_ptr[6]~q\ & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[6]~q\,
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X66_Y59_N14
\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (\pila:stack_ptr[7]~q\ & (!\Add0~13\)) # (!\pila:stack_ptr[7]~q\ & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!\pila:stack_ptr[7]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[7]~q\,
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X65_Y59_N16
\Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (\Add0~16_combout\ & (\Add1~15\ $ (GND))) # (!\Add0~16_combout\ & (!\Add1~15\ & VCC))
-- \Add1~17\ = CARRY((\Add0~16_combout\ & !\Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~16_combout\,
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

-- Location: LCCOMB_X67_Y59_N10
\pila:stack_ptr[8]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[8]~0_combout\ = (\pila~0_combout\ & ((\Add1~16_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[8]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila~0_combout\,
	datac => \pila:stack_ptr[8]~q\,
	datad => \Add1~16_combout\,
	combout => \pila:stack_ptr[8]~0_combout\);

-- Location: LCCOMB_X69_Y61_N16
\Add3~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~18_combout\ = (\Add2~16_combout\ & ((GND) # (!\Add3~17\))) # (!\Add2~16_combout\ & (\Add3~17\ $ (GND)))
-- \Add3~19\ = CARRY((\Add2~16_combout\) # (!\Add3~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~16_combout\,
	datad => VCC,
	cin => \Add3~17\,
	combout => \Add3~18_combout\,
	cout => \Add3~19\);

-- Location: LCCOMB_X67_Y59_N8
\Add3~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~90_combout\ = (\Add3~18_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~18_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~90_combout\);

-- Location: FF_X67_Y59_N11
\pila:stack_ptr[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[8]~0_combout\,
	asdata => \Add3~90_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[8]~q\);

-- Location: LCCOMB_X66_Y59_N16
\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (\pila:stack_ptr[8]~q\ & (\Add0~15\ $ (GND))) # (!\pila:stack_ptr[8]~q\ & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((\pila:stack_ptr[8]~q\ & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[8]~q\,
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X65_Y59_N18
\Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = (\Add0~18_combout\ & (!\Add1~17\)) # (!\Add0~18_combout\ & ((\Add1~17\) # (GND)))
-- \Add1~19\ = CARRY((!\Add1~17\) # (!\Add0~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~18_combout\,
	datad => VCC,
	cin => \Add1~17\,
	combout => \Add1~18_combout\,
	cout => \Add1~19\);

-- Location: LCCOMB_X67_Y59_N16
\pila:stack_ptr[9]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[9]~0_combout\ = (\pila~0_combout\ & ((\Add1~18_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[9]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila~0_combout\,
	datac => \pila:stack_ptr[9]~q\,
	datad => \Add1~18_combout\,
	combout => \pila:stack_ptr[9]~0_combout\);

-- Location: LCCOMB_X69_Y61_N18
\Add3~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~20_combout\ = (\Add2~18_combout\ & (\Add3~19\ & VCC)) # (!\Add2~18_combout\ & (!\Add3~19\))
-- \Add3~21\ = CARRY((!\Add2~18_combout\ & !\Add3~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~18_combout\,
	datad => VCC,
	cin => \Add3~19\,
	combout => \Add3~20_combout\,
	cout => \Add3~21\);

-- Location: LCCOMB_X67_Y59_N22
\Add3~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~89_combout\ = (\Add3~20_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~20_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~89_combout\);

-- Location: FF_X67_Y59_N17
\pila:stack_ptr[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[9]~0_combout\,
	asdata => \Add3~89_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[9]~q\);

-- Location: LCCOMB_X66_Y59_N18
\Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (\pila:stack_ptr[9]~q\ & (!\Add0~17\)) # (!\pila:stack_ptr[9]~q\ & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!\pila:stack_ptr[9]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[9]~q\,
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X65_Y59_N20
\Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = (\Add0~20_combout\ & (\Add1~19\ $ (GND))) # (!\Add0~20_combout\ & (!\Add1~19\ & VCC))
-- \Add1~21\ = CARRY((\Add0~20_combout\ & !\Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~20_combout\,
	datad => VCC,
	cin => \Add1~19\,
	combout => \Add1~20_combout\,
	cout => \Add1~21\);

-- Location: LCCOMB_X66_Y61_N18
\pila:stack_ptr[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[10]~0_combout\ = (\pila~0_combout\ & ((\Add1~20_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[10]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[10]~q\,
	datac => \pila~0_combout\,
	datad => \Add1~20_combout\,
	combout => \pila:stack_ptr[10]~0_combout\);

-- Location: LCCOMB_X66_Y61_N0
\pila:stack_ptr[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[10]~feeder_combout\ = \pila:stack_ptr[10]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pila:stack_ptr[10]~0_combout\,
	combout => \pila:stack_ptr[10]~feeder_combout\);

-- Location: LCCOMB_X69_Y61_N20
\Add3~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~22_combout\ = (\Add2~20_combout\ & ((GND) # (!\Add3~21\))) # (!\Add2~20_combout\ & (\Add3~21\ $ (GND)))
-- \Add3~23\ = CARRY((\Add2~20_combout\) # (!\Add3~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~20_combout\,
	datad => VCC,
	cin => \Add3~21\,
	combout => \Add3~22_combout\,
	cout => \Add3~23\);

-- Location: LCCOMB_X66_Y61_N4
\Add3~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~88_combout\ = (\Add3~22_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~22_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~88_combout\);

-- Location: FF_X66_Y61_N1
\pila:stack_ptr[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[10]~feeder_combout\,
	asdata => \Add3~88_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[10]~q\);

-- Location: LCCOMB_X66_Y59_N20
\Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (\pila:stack_ptr[10]~q\ & (\Add0~19\ $ (GND))) # (!\pila:stack_ptr[10]~q\ & (!\Add0~19\ & VCC))
-- \Add0~21\ = CARRY((\pila:stack_ptr[10]~q\ & !\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[10]~q\,
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: LCCOMB_X65_Y59_N22
\Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~22_combout\ = (\Add0~22_combout\ & (!\Add1~21\)) # (!\Add0~22_combout\ & ((\Add1~21\) # (GND)))
-- \Add1~23\ = CARRY((!\Add1~21\) # (!\Add0~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~22_combout\,
	datad => VCC,
	cin => \Add1~21\,
	combout => \Add1~22_combout\,
	cout => \Add1~23\);

-- Location: LCCOMB_X66_Y61_N16
\pila:stack_ptr[11]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[11]~0_combout\ = (\pila~0_combout\ & ((\Add1~22_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[11]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[11]~q\,
	datac => \pila~0_combout\,
	datad => \Add1~22_combout\,
	combout => \pila:stack_ptr[11]~0_combout\);

-- Location: LCCOMB_X66_Y61_N26
\pila:stack_ptr[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[11]~feeder_combout\ = \pila:stack_ptr[11]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pila:stack_ptr[11]~0_combout\,
	combout => \pila:stack_ptr[11]~feeder_combout\);

-- Location: LCCOMB_X69_Y61_N22
\Add3~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~24_combout\ = (\Add2~22_combout\ & (\Add3~23\ & VCC)) # (!\Add2~22_combout\ & (!\Add3~23\))
-- \Add3~25\ = CARRY((!\Add2~22_combout\ & !\Add3~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~22_combout\,
	datad => VCC,
	cin => \Add3~23\,
	combout => \Add3~24_combout\,
	cout => \Add3~25\);

-- Location: LCCOMB_X66_Y61_N14
\Add3~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~87_combout\ = (\Add3~24_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~24_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~87_combout\);

-- Location: FF_X66_Y61_N27
\pila:stack_ptr[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[11]~feeder_combout\,
	asdata => \Add3~87_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[11]~q\);

-- Location: LCCOMB_X66_Y59_N22
\Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (\pila:stack_ptr[11]~q\ & (!\Add0~21\)) # (!\pila:stack_ptr[11]~q\ & ((\Add0~21\) # (GND)))
-- \Add0~23\ = CARRY((!\Add0~21\) # (!\pila:stack_ptr[11]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[11]~q\,
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: LCCOMB_X65_Y59_N24
\Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~24_combout\ = (\Add0~24_combout\ & (\Add1~23\ $ (GND))) # (!\Add0~24_combout\ & (!\Add1~23\ & VCC))
-- \Add1~25\ = CARRY((\Add0~24_combout\ & !\Add1~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~24_combout\,
	datad => VCC,
	cin => \Add1~23\,
	combout => \Add1~24_combout\,
	cout => \Add1~25\);

-- Location: LCCOMB_X66_Y61_N22
\pila:stack_ptr[12]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[12]~0_combout\ = (\pila~0_combout\ & ((\Add1~24_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[12]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[12]~q\,
	datac => \Add1~24_combout\,
	datad => \pila~0_combout\,
	combout => \pila:stack_ptr[12]~0_combout\);

-- Location: LCCOMB_X66_Y61_N12
\pila:stack_ptr[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[12]~feeder_combout\ = \pila:stack_ptr[12]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[12]~0_combout\,
	combout => \pila:stack_ptr[12]~feeder_combout\);

-- Location: LCCOMB_X69_Y61_N24
\Add3~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~26_combout\ = (\Add2~24_combout\ & ((GND) # (!\Add3~25\))) # (!\Add2~24_combout\ & (\Add3~25\ $ (GND)))
-- \Add3~27\ = CARRY((\Add2~24_combout\) # (!\Add3~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~24_combout\,
	datad => VCC,
	cin => \Add3~25\,
	combout => \Add3~26_combout\,
	cout => \Add3~27\);

-- Location: LCCOMB_X66_Y61_N8
\Add3~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~86_combout\ = (\Add3~26_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~26_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~86_combout\);

-- Location: FF_X66_Y61_N13
\pila:stack_ptr[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[12]~feeder_combout\,
	asdata => \Add3~86_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[12]~q\);

-- Location: LCCOMB_X66_Y59_N24
\Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = (\pila:stack_ptr[12]~q\ & (\Add0~23\ $ (GND))) # (!\pila:stack_ptr[12]~q\ & (!\Add0~23\ & VCC))
-- \Add0~25\ = CARRY((\pila:stack_ptr[12]~q\ & !\Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[12]~q\,
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: LCCOMB_X65_Y59_N26
\Add1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~26_combout\ = (\Add0~26_combout\ & (!\Add1~25\)) # (!\Add0~26_combout\ & ((\Add1~25\) # (GND)))
-- \Add1~27\ = CARRY((!\Add1~25\) # (!\Add0~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~26_combout\,
	datad => VCC,
	cin => \Add1~25\,
	combout => \Add1~26_combout\,
	cout => \Add1~27\);

-- Location: LCCOMB_X67_Y61_N14
\pila:stack_ptr[13]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[13]~0_combout\ = (\pila~0_combout\ & ((\Add1~26_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[13]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[13]~q\,
	datac => \Add1~26_combout\,
	datad => \pila~0_combout\,
	combout => \pila:stack_ptr[13]~0_combout\);

-- Location: LCCOMB_X67_Y61_N28
\pila:stack_ptr[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[13]~feeder_combout\ = \pila:stack_ptr[13]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[13]~0_combout\,
	combout => \pila:stack_ptr[13]~feeder_combout\);

-- Location: LCCOMB_X69_Y61_N26
\Add3~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~28_combout\ = (\Add2~26_combout\ & (\Add3~27\ & VCC)) # (!\Add2~26_combout\ & (!\Add3~27\))
-- \Add3~29\ = CARRY((!\Add2~26_combout\ & !\Add3~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~26_combout\,
	datad => VCC,
	cin => \Add3~27\,
	combout => \Add3~28_combout\,
	cout => \Add3~29\);

-- Location: LCCOMB_X67_Y61_N30
\Add3~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~85_combout\ = (\Add3~28_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~28_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~85_combout\);

-- Location: FF_X67_Y61_N29
\pila:stack_ptr[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[13]~feeder_combout\,
	asdata => \Add3~85_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[13]~q\);

-- Location: LCCOMB_X66_Y59_N26
\Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (\pila:stack_ptr[13]~q\ & (!\Add0~25\)) # (!\pila:stack_ptr[13]~q\ & ((\Add0~25\) # (GND)))
-- \Add0~27\ = CARRY((!\Add0~25\) # (!\pila:stack_ptr[13]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[13]~q\,
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: LCCOMB_X65_Y59_N28
\Add1~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~28_combout\ = (\Add0~28_combout\ & (\Add1~27\ $ (GND))) # (!\Add0~28_combout\ & (!\Add1~27\ & VCC))
-- \Add1~29\ = CARRY((\Add0~28_combout\ & !\Add1~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~28_combout\,
	datad => VCC,
	cin => \Add1~27\,
	combout => \Add1~28_combout\,
	cout => \Add1~29\);

-- Location: LCCOMB_X67_Y61_N16
\pila:stack_ptr[14]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[14]~0_combout\ = (\pila~0_combout\ & ((\Add1~28_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[14]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila~0_combout\,
	datac => \pila:stack_ptr[14]~q\,
	datad => \Add1~28_combout\,
	combout => \pila:stack_ptr[14]~0_combout\);

-- Location: LCCOMB_X67_Y61_N18
\pila:stack_ptr[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[14]~feeder_combout\ = \pila:stack_ptr[14]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pila:stack_ptr[14]~0_combout\,
	combout => \pila:stack_ptr[14]~feeder_combout\);

-- Location: LCCOMB_X69_Y61_N28
\Add3~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~30_combout\ = (\Add2~28_combout\ & ((GND) # (!\Add3~29\))) # (!\Add2~28_combout\ & (\Add3~29\ $ (GND)))
-- \Add3~31\ = CARRY((\Add2~28_combout\) # (!\Add3~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~28_combout\,
	datad => VCC,
	cin => \Add3~29\,
	combout => \Add3~30_combout\,
	cout => \Add3~31\);

-- Location: LCCOMB_X67_Y61_N4
\Add3~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~84_combout\ = (\Add3~30_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~30_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~84_combout\);

-- Location: FF_X67_Y61_N19
\pila:stack_ptr[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[14]~feeder_combout\,
	asdata => \Add3~84_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[14]~q\);

-- Location: LCCOMB_X66_Y59_N28
\Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = (\pila:stack_ptr[14]~q\ & (\Add0~27\ $ (GND))) # (!\pila:stack_ptr[14]~q\ & (!\Add0~27\ & VCC))
-- \Add0~29\ = CARRY((\pila:stack_ptr[14]~q\ & !\Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[14]~q\,
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: LCCOMB_X65_Y59_N30
\Add1~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~30_combout\ = (\Add0~30_combout\ & (!\Add1~29\)) # (!\Add0~30_combout\ & ((\Add1~29\) # (GND)))
-- \Add1~31\ = CARRY((!\Add1~29\) # (!\Add0~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~30_combout\,
	datad => VCC,
	cin => \Add1~29\,
	combout => \Add1~30_combout\,
	cout => \Add1~31\);

-- Location: LCCOMB_X67_Y61_N10
\pila:stack_ptr[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[15]~0_combout\ = (\pila~0_combout\ & (\Add1~30_combout\)) # (!\pila~0_combout\ & ((\pila:stack_ptr[15]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila~0_combout\,
	datac => \Add1~30_combout\,
	datad => \pila:stack_ptr[15]~q\,
	combout => \pila:stack_ptr[15]~0_combout\);

-- Location: LCCOMB_X67_Y61_N20
\pila:stack_ptr[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[15]~feeder_combout\ = \pila:stack_ptr[15]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pila:stack_ptr[15]~0_combout\,
	combout => \pila:stack_ptr[15]~feeder_combout\);

-- Location: LCCOMB_X69_Y61_N30
\Add3~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~32_combout\ = (\Add2~30_combout\ & (\Add3~31\ & VCC)) # (!\Add2~30_combout\ & (!\Add3~31\))
-- \Add3~33\ = CARRY((!\Add2~30_combout\ & !\Add3~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~30_combout\,
	datad => VCC,
	cin => \Add3~31\,
	combout => \Add3~32_combout\,
	cout => \Add3~33\);

-- Location: LCCOMB_X67_Y61_N22
\Add3~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~83_combout\ = (\Add3~32_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add3~32_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~83_combout\);

-- Location: FF_X67_Y61_N21
\pila:stack_ptr[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[15]~feeder_combout\,
	asdata => \Add3~83_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[15]~q\);

-- Location: LCCOMB_X66_Y59_N30
\Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (\pila:stack_ptr[15]~q\ & (!\Add0~29\)) # (!\pila:stack_ptr[15]~q\ & ((\Add0~29\) # (GND)))
-- \Add0~31\ = CARRY((!\Add0~29\) # (!\pila:stack_ptr[15]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[15]~q\,
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

-- Location: LCCOMB_X65_Y58_N0
\Add1~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~32_combout\ = (\Add0~32_combout\ & (\Add1~31\ $ (GND))) # (!\Add0~32_combout\ & (!\Add1~31\ & VCC))
-- \Add1~33\ = CARRY((\Add0~32_combout\ & !\Add1~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~32_combout\,
	datad => VCC,
	cin => \Add1~31\,
	combout => \Add1~32_combout\,
	cout => \Add1~33\);

-- Location: LCCOMB_X68_Y58_N16
\pila:stack_ptr[16]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[16]~0_combout\ = (\pila~0_combout\ & ((\Add1~32_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[16]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[16]~q\,
	datac => \pila~0_combout\,
	datad => \Add1~32_combout\,
	combout => \pila:stack_ptr[16]~0_combout\);

-- Location: LCCOMB_X67_Y61_N2
\pila:stack_ptr[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[16]~feeder_combout\ = \pila:stack_ptr[16]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[16]~0_combout\,
	combout => \pila:stack_ptr[16]~feeder_combout\);

-- Location: LCCOMB_X69_Y60_N0
\Add3~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~34_combout\ = (\Add2~32_combout\ & ((GND) # (!\Add3~33\))) # (!\Add2~32_combout\ & (\Add3~33\ $ (GND)))
-- \Add3~35\ = CARRY((\Add2~32_combout\) # (!\Add3~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~32_combout\,
	datad => VCC,
	cin => \Add3~33\,
	combout => \Add3~34_combout\,
	cout => \Add3~35\);

-- Location: LCCOMB_X67_Y61_N8
\Add3~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~82_combout\ = (\Add3~34_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~34_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~82_combout\);

-- Location: FF_X67_Y61_N3
\pila:stack_ptr[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[16]~feeder_combout\,
	asdata => \Add3~82_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[16]~q\);

-- Location: LCCOMB_X66_Y58_N0
\Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = (\pila:stack_ptr[16]~q\ & (\Add0~31\ $ (GND))) # (!\pila:stack_ptr[16]~q\ & (!\Add0~31\ & VCC))
-- \Add0~33\ = CARRY((\pila:stack_ptr[16]~q\ & !\Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[16]~q\,
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

-- Location: LCCOMB_X65_Y58_N2
\Add1~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~34_combout\ = (\Add0~34_combout\ & (!\Add1~33\)) # (!\Add0~34_combout\ & ((\Add1~33\) # (GND)))
-- \Add1~35\ = CARRY((!\Add1~33\) # (!\Add0~34_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~34_combout\,
	datad => VCC,
	cin => \Add1~33\,
	combout => \Add1~34_combout\,
	cout => \Add1~35\);

-- Location: LCCOMB_X65_Y60_N0
\pila:stack_ptr[17]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[17]~0_combout\ = (\pila~0_combout\ & ((\Add1~34_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[17]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[17]~q\,
	datac => \pila~0_combout\,
	datad => \Add1~34_combout\,
	combout => \pila:stack_ptr[17]~0_combout\);

-- Location: LCCOMB_X67_Y61_N24
\pila:stack_ptr[17]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[17]~feeder_combout\ = \pila:stack_ptr[17]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pila:stack_ptr[17]~0_combout\,
	combout => \pila:stack_ptr[17]~feeder_combout\);

-- Location: LCCOMB_X69_Y60_N2
\Add3~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~36_combout\ = (\Add2~34_combout\ & (\Add3~35\ & VCC)) # (!\Add2~34_combout\ & (!\Add3~35\))
-- \Add3~37\ = CARRY((!\Add2~34_combout\ & !\Add3~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~34_combout\,
	datad => VCC,
	cin => \Add3~35\,
	combout => \Add3~36_combout\,
	cout => \Add3~37\);

-- Location: LCCOMB_X67_Y61_N26
\Add3~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~81_combout\ = (\Add3~36_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~36_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~81_combout\);

-- Location: FF_X67_Y61_N25
\pila:stack_ptr[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[17]~feeder_combout\,
	asdata => \Add3~81_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[17]~q\);

-- Location: LCCOMB_X66_Y58_N2
\Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (\pila:stack_ptr[17]~q\ & (!\Add0~33\)) # (!\pila:stack_ptr[17]~q\ & ((\Add0~33\) # (GND)))
-- \Add0~35\ = CARRY((!\Add0~33\) # (!\pila:stack_ptr[17]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[17]~q\,
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

-- Location: LCCOMB_X65_Y58_N4
\Add1~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~36_combout\ = (\Add0~36_combout\ & (\Add1~35\ $ (GND))) # (!\Add0~36_combout\ & (!\Add1~35\ & VCC))
-- \Add1~37\ = CARRY((\Add0~36_combout\ & !\Add1~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~36_combout\,
	datad => VCC,
	cin => \Add1~35\,
	combout => \Add1~36_combout\,
	cout => \Add1~37\);

-- Location: LCCOMB_X65_Y60_N18
\pila:stack_ptr[18]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[18]~0_combout\ = (\pila~0_combout\ & ((\Add1~36_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[18]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~0_combout\,
	datac => \pila:stack_ptr[18]~q\,
	datad => \Add1~36_combout\,
	combout => \pila:stack_ptr[18]~0_combout\);

-- Location: LCCOMB_X69_Y60_N4
\Add3~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~38_combout\ = (\Add2~36_combout\ & ((GND) # (!\Add3~37\))) # (!\Add2~36_combout\ & (\Add3~37\ $ (GND)))
-- \Add3~39\ = CARRY((\Add2~36_combout\) # (!\Add3~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~36_combout\,
	datad => VCC,
	cin => \Add3~37\,
	combout => \Add3~38_combout\,
	cout => \Add3~39\);

-- Location: LCCOMB_X65_Y60_N22
\Add3~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~80_combout\ = (\Add3~38_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add3~38_combout\,
	datac => \Equal3~10_combout\,
	combout => \Add3~80_combout\);

-- Location: FF_X65_Y60_N19
\pila:stack_ptr[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[18]~0_combout\,
	asdata => \Add3~80_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[18]~q\);

-- Location: LCCOMB_X66_Y58_N4
\Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = (\pila:stack_ptr[18]~q\ & (\Add0~35\ $ (GND))) # (!\pila:stack_ptr[18]~q\ & (!\Add0~35\ & VCC))
-- \Add0~37\ = CARRY((\pila:stack_ptr[18]~q\ & !\Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[18]~q\,
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~36_combout\,
	cout => \Add0~37\);

-- Location: LCCOMB_X65_Y58_N6
\Add1~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~38_combout\ = (\Add0~38_combout\ & (!\Add1~37\)) # (!\Add0~38_combout\ & ((\Add1~37\) # (GND)))
-- \Add1~39\ = CARRY((!\Add1~37\) # (!\Add0~38_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~38_combout\,
	datad => VCC,
	cin => \Add1~37\,
	combout => \Add1~38_combout\,
	cout => \Add1~39\);

-- Location: LCCOMB_X65_Y60_N24
\pila:stack_ptr[19]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[19]~0_combout\ = (\pila~0_combout\ & ((\Add1~38_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[19]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~0_combout\,
	datac => \pila:stack_ptr[19]~q\,
	datad => \Add1~38_combout\,
	combout => \pila:stack_ptr[19]~0_combout\);

-- Location: LCCOMB_X69_Y60_N6
\Add3~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~40_combout\ = (\Add2~38_combout\ & (\Add3~39\ & VCC)) # (!\Add2~38_combout\ & (!\Add3~39\))
-- \Add3~41\ = CARRY((!\Add2~38_combout\ & !\Add3~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~38_combout\,
	datad => VCC,
	cin => \Add3~39\,
	combout => \Add3~40_combout\,
	cout => \Add3~41\);

-- Location: LCCOMB_X65_Y60_N4
\Add3~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~79_combout\ = (!\Equal3~10_combout\ & \Add3~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal3~10_combout\,
	datad => \Add3~40_combout\,
	combout => \Add3~79_combout\);

-- Location: FF_X65_Y60_N25
\pila:stack_ptr[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[19]~0_combout\,
	asdata => \Add3~79_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[19]~q\);

-- Location: LCCOMB_X66_Y58_N6
\Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (\pila:stack_ptr[19]~q\ & (!\Add0~37\)) # (!\pila:stack_ptr[19]~q\ & ((\Add0~37\) # (GND)))
-- \Add0~39\ = CARRY((!\Add0~37\) # (!\pila:stack_ptr[19]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[19]~q\,
	datad => VCC,
	cin => \Add0~37\,
	combout => \Add0~38_combout\,
	cout => \Add0~39\);

-- Location: LCCOMB_X65_Y58_N8
\Add1~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~40_combout\ = (\Add0~40_combout\ & (\Add1~39\ $ (GND))) # (!\Add0~40_combout\ & (!\Add1~39\ & VCC))
-- \Add1~41\ = CARRY((\Add0~40_combout\ & !\Add1~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~40_combout\,
	datad => VCC,
	cin => \Add1~39\,
	combout => \Add1~40_combout\,
	cout => \Add1~41\);

-- Location: LCCOMB_X66_Y60_N24
\pila:stack_ptr[20]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[20]~0_combout\ = (\pila~0_combout\ & ((\Add1~40_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[20]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~0_combout\,
	datac => \pila:stack_ptr[20]~q\,
	datad => \Add1~40_combout\,
	combout => \pila:stack_ptr[20]~0_combout\);

-- Location: LCCOMB_X69_Y60_N8
\Add3~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~42_combout\ = (\Add2~40_combout\ & ((GND) # (!\Add3~41\))) # (!\Add2~40_combout\ & (\Add3~41\ $ (GND)))
-- \Add3~43\ = CARRY((\Add2~40_combout\) # (!\Add3~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~40_combout\,
	datad => VCC,
	cin => \Add3~41\,
	combout => \Add3~42_combout\,
	cout => \Add3~43\);

-- Location: LCCOMB_X66_Y60_N20
\Add3~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~78_combout\ = (\Add3~42_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add3~42_combout\,
	datac => \Equal3~10_combout\,
	combout => \Add3~78_combout\);

-- Location: FF_X66_Y60_N25
\pila:stack_ptr[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[20]~0_combout\,
	asdata => \Add3~78_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[20]~q\);

-- Location: LCCOMB_X66_Y58_N8
\Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~40_combout\ = (\pila:stack_ptr[20]~q\ & (\Add0~39\ $ (GND))) # (!\pila:stack_ptr[20]~q\ & (!\Add0~39\ & VCC))
-- \Add0~41\ = CARRY((\pila:stack_ptr[20]~q\ & !\Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[20]~q\,
	datad => VCC,
	cin => \Add0~39\,
	combout => \Add0~40_combout\,
	cout => \Add0~41\);

-- Location: LCCOMB_X65_Y58_N10
\Add1~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~42_combout\ = (\Add0~42_combout\ & (!\Add1~41\)) # (!\Add0~42_combout\ & ((\Add1~41\) # (GND)))
-- \Add1~43\ = CARRY((!\Add1~41\) # (!\Add0~42_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~42_combout\,
	datad => VCC,
	cin => \Add1~41\,
	combout => \Add1~42_combout\,
	cout => \Add1~43\);

-- Location: LCCOMB_X65_Y60_N10
\pila:stack_ptr[21]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[21]~0_combout\ = (\pila~0_combout\ & ((\Add1~42_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[21]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~0_combout\,
	datac => \pila:stack_ptr[21]~q\,
	datad => \Add1~42_combout\,
	combout => \pila:stack_ptr[21]~0_combout\);

-- Location: LCCOMB_X69_Y60_N10
\Add3~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~44_combout\ = (\Add2~42_combout\ & (\Add3~43\ & VCC)) # (!\Add2~42_combout\ & (!\Add3~43\))
-- \Add3~45\ = CARRY((!\Add2~42_combout\ & !\Add3~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~42_combout\,
	datad => VCC,
	cin => \Add3~43\,
	combout => \Add3~44_combout\,
	cout => \Add3~45\);

-- Location: LCCOMB_X65_Y60_N30
\Add3~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~77_combout\ = (!\Equal3~10_combout\ & \Add3~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal3~10_combout\,
	datad => \Add3~44_combout\,
	combout => \Add3~77_combout\);

-- Location: FF_X65_Y60_N11
\pila:stack_ptr[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[21]~0_combout\,
	asdata => \Add3~77_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[21]~q\);

-- Location: LCCOMB_X66_Y58_N10
\Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~42_combout\ = (\pila:stack_ptr[21]~q\ & (!\Add0~41\)) # (!\pila:stack_ptr[21]~q\ & ((\Add0~41\) # (GND)))
-- \Add0~43\ = CARRY((!\Add0~41\) # (!\pila:stack_ptr[21]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[21]~q\,
	datad => VCC,
	cin => \Add0~41\,
	combout => \Add0~42_combout\,
	cout => \Add0~43\);

-- Location: LCCOMB_X65_Y58_N12
\Add1~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~44_combout\ = (\Add0~44_combout\ & (\Add1~43\ $ (GND))) # (!\Add0~44_combout\ & (!\Add1~43\ & VCC))
-- \Add1~45\ = CARRY((\Add0~44_combout\ & !\Add1~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~44_combout\,
	datad => VCC,
	cin => \Add1~43\,
	combout => \Add1~44_combout\,
	cout => \Add1~45\);

-- Location: LCCOMB_X65_Y60_N20
\pila:stack_ptr[22]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[22]~0_combout\ = (\pila~0_combout\ & ((\Add1~44_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[22]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~0_combout\,
	datac => \pila:stack_ptr[22]~q\,
	datad => \Add1~44_combout\,
	combout => \pila:stack_ptr[22]~0_combout\);

-- Location: LCCOMB_X69_Y60_N12
\Add3~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~46_combout\ = (\Add2~44_combout\ & ((GND) # (!\Add3~45\))) # (!\Add2~44_combout\ & (\Add3~45\ $ (GND)))
-- \Add3~47\ = CARRY((\Add2~44_combout\) # (!\Add3~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~44_combout\,
	datad => VCC,
	cin => \Add3~45\,
	combout => \Add3~46_combout\,
	cout => \Add3~47\);

-- Location: LCCOMB_X65_Y60_N8
\Add3~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~76_combout\ = (!\Equal3~10_combout\ & \Add3~46_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal3~10_combout\,
	datad => \Add3~46_combout\,
	combout => \Add3~76_combout\);

-- Location: FF_X65_Y60_N21
\pila:stack_ptr[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[22]~0_combout\,
	asdata => \Add3~76_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[22]~q\);

-- Location: LCCOMB_X66_Y58_N12
\Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = (\pila:stack_ptr[22]~q\ & (\Add0~43\ $ (GND))) # (!\pila:stack_ptr[22]~q\ & (!\Add0~43\ & VCC))
-- \Add0~45\ = CARRY((\pila:stack_ptr[22]~q\ & !\Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[22]~q\,
	datad => VCC,
	cin => \Add0~43\,
	combout => \Add0~44_combout\,
	cout => \Add0~45\);

-- Location: LCCOMB_X65_Y58_N14
\Add1~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~46_combout\ = (\Add0~46_combout\ & (!\Add1~45\)) # (!\Add0~46_combout\ & ((\Add1~45\) # (GND)))
-- \Add1~47\ = CARRY((!\Add1~45\) # (!\Add0~46_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~46_combout\,
	datad => VCC,
	cin => \Add1~45\,
	combout => \Add1~46_combout\,
	cout => \Add1~47\);

-- Location: LCCOMB_X65_Y60_N2
\pila:stack_ptr[23]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[23]~0_combout\ = (\pila~0_combout\ & (\Add1~46_combout\)) # (!\pila~0_combout\ & ((\pila:stack_ptr[23]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~0_combout\,
	datab => \Add1~46_combout\,
	datac => \pila:stack_ptr[23]~q\,
	combout => \pila:stack_ptr[23]~0_combout\);

-- Location: LCCOMB_X69_Y60_N14
\Add3~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~48_combout\ = (\Add2~46_combout\ & (\Add3~47\ & VCC)) # (!\Add2~46_combout\ & (!\Add3~47\))
-- \Add3~49\ = CARRY((!\Add2~46_combout\ & !\Add3~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~46_combout\,
	datad => VCC,
	cin => \Add3~47\,
	combout => \Add3~48_combout\,
	cout => \Add3~49\);

-- Location: LCCOMB_X65_Y60_N26
\Add3~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~75_combout\ = (\Add3~48_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add3~48_combout\,
	datac => \Equal3~10_combout\,
	combout => \Add3~75_combout\);

-- Location: FF_X65_Y60_N3
\pila:stack_ptr[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[23]~0_combout\,
	asdata => \Add3~75_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[23]~q\);

-- Location: LCCOMB_X66_Y58_N14
\Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~46_combout\ = (\pila:stack_ptr[23]~q\ & (!\Add0~45\)) # (!\pila:stack_ptr[23]~q\ & ((\Add0~45\) # (GND)))
-- \Add0~47\ = CARRY((!\Add0~45\) # (!\pila:stack_ptr[23]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[23]~q\,
	datad => VCC,
	cin => \Add0~45\,
	combout => \Add0~46_combout\,
	cout => \Add0~47\);

-- Location: LCCOMB_X65_Y58_N16
\Add1~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~48_combout\ = (\Add0~48_combout\ & (\Add1~47\ $ (GND))) # (!\Add0~48_combout\ & (!\Add1~47\ & VCC))
-- \Add1~49\ = CARRY((\Add0~48_combout\ & !\Add1~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~48_combout\,
	datad => VCC,
	cin => \Add1~47\,
	combout => \Add1~48_combout\,
	cout => \Add1~49\);

-- Location: LCCOMB_X65_Y60_N16
\pila:stack_ptr[24]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[24]~0_combout\ = (\pila~0_combout\ & ((\Add1~48_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[24]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~0_combout\,
	datac => \pila:stack_ptr[24]~q\,
	datad => \Add1~48_combout\,
	combout => \pila:stack_ptr[24]~0_combout\);

-- Location: LCCOMB_X69_Y60_N16
\Add3~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~50_combout\ = (\Add2~48_combout\ & ((GND) # (!\Add3~49\))) # (!\Add2~48_combout\ & (\Add3~49\ $ (GND)))
-- \Add3~51\ = CARRY((\Add2~48_combout\) # (!\Add3~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~48_combout\,
	datad => VCC,
	cin => \Add3~49\,
	combout => \Add3~50_combout\,
	cout => \Add3~51\);

-- Location: LCCOMB_X65_Y60_N28
\Add3~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~74_combout\ = (!\Equal3~10_combout\ & \Add3~50_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal3~10_combout\,
	datad => \Add3~50_combout\,
	combout => \Add3~74_combout\);

-- Location: FF_X65_Y60_N17
\pila:stack_ptr[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[24]~0_combout\,
	asdata => \Add3~74_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[24]~q\);

-- Location: LCCOMB_X66_Y58_N16
\Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~48_combout\ = (\pila:stack_ptr[24]~q\ & (\Add0~47\ $ (GND))) # (!\pila:stack_ptr[24]~q\ & (!\Add0~47\ & VCC))
-- \Add0~49\ = CARRY((\pila:stack_ptr[24]~q\ & !\Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[24]~q\,
	datad => VCC,
	cin => \Add0~47\,
	combout => \Add0~48_combout\,
	cout => \Add0~49\);

-- Location: LCCOMB_X65_Y58_N18
\Add1~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~50_combout\ = (\Add0~50_combout\ & (!\Add1~49\)) # (!\Add0~50_combout\ & ((\Add1~49\) # (GND)))
-- \Add1~51\ = CARRY((!\Add1~49\) # (!\Add0~50_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~50_combout\,
	datad => VCC,
	cin => \Add1~49\,
	combout => \Add1~50_combout\,
	cout => \Add1~51\);

-- Location: LCCOMB_X66_Y60_N28
\pila:stack_ptr[25]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[25]~0_combout\ = (\pila~0_combout\ & ((\Add1~50_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[25]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[25]~q\,
	datac => \pila~0_combout\,
	datad => \Add1~50_combout\,
	combout => \pila:stack_ptr[25]~0_combout\);

-- Location: LCCOMB_X66_Y60_N2
\pila:stack_ptr[25]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[25]~feeder_combout\ = \pila:stack_ptr[25]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pila:stack_ptr[25]~0_combout\,
	combout => \pila:stack_ptr[25]~feeder_combout\);

-- Location: LCCOMB_X69_Y60_N18
\Add3~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~52_combout\ = (\Add2~50_combout\ & (\Add3~51\ & VCC)) # (!\Add2~50_combout\ & (!\Add3~51\))
-- \Add3~53\ = CARRY((!\Add2~50_combout\ & !\Add3~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~50_combout\,
	datad => VCC,
	cin => \Add3~51\,
	combout => \Add3~52_combout\,
	cout => \Add3~53\);

-- Location: LCCOMB_X66_Y60_N14
\Add3~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~73_combout\ = (!\Equal3~10_combout\ & \Add3~52_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal3~10_combout\,
	datad => \Add3~52_combout\,
	combout => \Add3~73_combout\);

-- Location: FF_X66_Y60_N3
\pila:stack_ptr[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[25]~feeder_combout\,
	asdata => \Add3~73_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[25]~q\);

-- Location: LCCOMB_X66_Y58_N18
\Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~50_combout\ = (\pila:stack_ptr[25]~q\ & (!\Add0~49\)) # (!\pila:stack_ptr[25]~q\ & ((\Add0~49\) # (GND)))
-- \Add0~51\ = CARRY((!\Add0~49\) # (!\pila:stack_ptr[25]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[25]~q\,
	datad => VCC,
	cin => \Add0~49\,
	combout => \Add0~50_combout\,
	cout => \Add0~51\);

-- Location: LCCOMB_X65_Y58_N20
\Add1~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~52_combout\ = (\Add0~52_combout\ & (\Add1~51\ $ (GND))) # (!\Add0~52_combout\ & (!\Add1~51\ & VCC))
-- \Add1~53\ = CARRY((\Add0~52_combout\ & !\Add1~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~52_combout\,
	datad => VCC,
	cin => \Add1~51\,
	combout => \Add1~52_combout\,
	cout => \Add1~53\);

-- Location: LCCOMB_X66_Y60_N12
\pila:stack_ptr[26]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[26]~0_combout\ = (\pila~0_combout\ & ((\Add1~52_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[26]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~0_combout\,
	datac => \pila:stack_ptr[26]~q\,
	datad => \Add1~52_combout\,
	combout => \pila:stack_ptr[26]~0_combout\);

-- Location: LCCOMB_X69_Y60_N20
\Add3~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~54_combout\ = (\Add2~52_combout\ & ((GND) # (!\Add3~53\))) # (!\Add2~52_combout\ & (\Add3~53\ $ (GND)))
-- \Add3~55\ = CARRY((\Add2~52_combout\) # (!\Add3~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~52_combout\,
	datad => VCC,
	cin => \Add3~53\,
	combout => \Add3~54_combout\,
	cout => \Add3~55\);

-- Location: LCCOMB_X66_Y60_N4
\Add3~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~72_combout\ = (!\Equal3~10_combout\ & \Add3~54_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal3~10_combout\,
	datad => \Add3~54_combout\,
	combout => \Add3~72_combout\);

-- Location: FF_X66_Y60_N13
\pila:stack_ptr[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[26]~0_combout\,
	asdata => \Add3~72_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[26]~q\);

-- Location: LCCOMB_X66_Y58_N20
\Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~52_combout\ = (\pila:stack_ptr[26]~q\ & (\Add0~51\ $ (GND))) # (!\pila:stack_ptr[26]~q\ & (!\Add0~51\ & VCC))
-- \Add0~53\ = CARRY((\pila:stack_ptr[26]~q\ & !\Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[26]~q\,
	datad => VCC,
	cin => \Add0~51\,
	combout => \Add0~52_combout\,
	cout => \Add0~53\);

-- Location: LCCOMB_X65_Y58_N22
\Add1~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~54_combout\ = (\Add0~54_combout\ & (!\Add1~53\)) # (!\Add0~54_combout\ & ((\Add1~53\) # (GND)))
-- \Add1~55\ = CARRY((!\Add1~53\) # (!\Add0~54_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~54_combout\,
	datad => VCC,
	cin => \Add1~53\,
	combout => \Add1~54_combout\,
	cout => \Add1~55\);

-- Location: LCCOMB_X66_Y60_N6
\pila:stack_ptr[27]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[27]~0_combout\ = (\pila~0_combout\ & ((\Add1~54_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[27]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~0_combout\,
	datac => \pila:stack_ptr[27]~q\,
	datad => \Add1~54_combout\,
	combout => \pila:stack_ptr[27]~0_combout\);

-- Location: LCCOMB_X69_Y60_N22
\Add3~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~56_combout\ = (\Add2~54_combout\ & (\Add3~55\ & VCC)) # (!\Add2~54_combout\ & (!\Add3~55\))
-- \Add3~57\ = CARRY((!\Add2~54_combout\ & !\Add3~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~54_combout\,
	datad => VCC,
	cin => \Add3~55\,
	combout => \Add3~56_combout\,
	cout => \Add3~57\);

-- Location: LCCOMB_X66_Y60_N26
\Add3~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~71_combout\ = (!\Equal3~10_combout\ & \Add3~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal3~10_combout\,
	datad => \Add3~56_combout\,
	combout => \Add3~71_combout\);

-- Location: FF_X66_Y60_N7
\pila:stack_ptr[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[27]~0_combout\,
	asdata => \Add3~71_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[27]~q\);

-- Location: LCCOMB_X66_Y58_N22
\Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~54_combout\ = (\pila:stack_ptr[27]~q\ & (!\Add0~53\)) # (!\pila:stack_ptr[27]~q\ & ((\Add0~53\) # (GND)))
-- \Add0~55\ = CARRY((!\Add0~53\) # (!\pila:stack_ptr[27]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[27]~q\,
	datad => VCC,
	cin => \Add0~53\,
	combout => \Add0~54_combout\,
	cout => \Add0~55\);

-- Location: LCCOMB_X65_Y58_N24
\Add1~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~56_combout\ = (\Add0~56_combout\ & (\Add1~55\ $ (GND))) # (!\Add0~56_combout\ & (!\Add1~55\ & VCC))
-- \Add1~57\ = CARRY((\Add0~56_combout\ & !\Add1~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~56_combout\,
	datad => VCC,
	cin => \Add1~55\,
	combout => \Add1~56_combout\,
	cout => \Add1~57\);

-- Location: LCCOMB_X66_Y60_N16
\pila:stack_ptr[28]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[28]~0_combout\ = (\pila~0_combout\ & ((\Add1~56_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[28]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~0_combout\,
	datac => \pila:stack_ptr[28]~q\,
	datad => \Add1~56_combout\,
	combout => \pila:stack_ptr[28]~0_combout\);

-- Location: LCCOMB_X69_Y60_N24
\Add3~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~58_combout\ = (\Add2~56_combout\ & ((GND) # (!\Add3~57\))) # (!\Add2~56_combout\ & (\Add3~57\ $ (GND)))
-- \Add3~59\ = CARRY((\Add2~56_combout\) # (!\Add3~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~56_combout\,
	datad => VCC,
	cin => \Add3~57\,
	combout => \Add3~58_combout\,
	cout => \Add3~59\);

-- Location: LCCOMB_X66_Y60_N8
\Add3~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~70_combout\ = (!\Equal3~10_combout\ & \Add3~58_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal3~10_combout\,
	datad => \Add3~58_combout\,
	combout => \Add3~70_combout\);

-- Location: FF_X66_Y60_N17
\pila:stack_ptr[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[28]~0_combout\,
	asdata => \Add3~70_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[28]~q\);

-- Location: LCCOMB_X66_Y58_N24
\Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~56_combout\ = (\pila:stack_ptr[28]~q\ & (\Add0~55\ $ (GND))) # (!\pila:stack_ptr[28]~q\ & (!\Add0~55\ & VCC))
-- \Add0~57\ = CARRY((\pila:stack_ptr[28]~q\ & !\Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[28]~q\,
	datad => VCC,
	cin => \Add0~55\,
	combout => \Add0~56_combout\,
	cout => \Add0~57\);

-- Location: LCCOMB_X65_Y58_N26
\Add1~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~58_combout\ = (\Add0~58_combout\ & (!\Add1~57\)) # (!\Add0~58_combout\ & ((\Add1~57\) # (GND)))
-- \Add1~59\ = CARRY((!\Add1~57\) # (!\Add0~58_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~58_combout\,
	datad => VCC,
	cin => \Add1~57\,
	combout => \Add1~58_combout\,
	cout => \Add1~59\);

-- Location: LCCOMB_X68_Y59_N26
\pila:stack_ptr[29]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[29]~0_combout\ = (\pila~0_combout\ & ((\Add1~58_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[29]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[29]~q\,
	datac => \pila~0_combout\,
	datad => \Add1~58_combout\,
	combout => \pila:stack_ptr[29]~0_combout\);

-- Location: LCCOMB_X68_Y59_N30
\pila:stack_ptr[29]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[29]~feeder_combout\ = \pila:stack_ptr[29]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[29]~0_combout\,
	combout => \pila:stack_ptr[29]~feeder_combout\);

-- Location: LCCOMB_X69_Y60_N26
\Add3~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~60_combout\ = (\Add2~58_combout\ & (\Add3~59\ & VCC)) # (!\Add2~58_combout\ & (!\Add3~59\))
-- \Add3~61\ = CARRY((!\Add2~58_combout\ & !\Add3~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~58_combout\,
	datad => VCC,
	cin => \Add3~59\,
	combout => \Add3~60_combout\,
	cout => \Add3~61\);

-- Location: LCCOMB_X68_Y59_N8
\Add3~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~69_combout\ = (!\Equal3~10_combout\ & \Add3~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal3~10_combout\,
	datad => \Add3~60_combout\,
	combout => \Add3~69_combout\);

-- Location: FF_X68_Y59_N31
\pila:stack_ptr[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[29]~feeder_combout\,
	asdata => \Add3~69_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[29]~q\);

-- Location: LCCOMB_X66_Y58_N26
\Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~58_combout\ = (\pila:stack_ptr[29]~q\ & (!\Add0~57\)) # (!\pila:stack_ptr[29]~q\ & ((\Add0~57\) # (GND)))
-- \Add0~59\ = CARRY((!\Add0~57\) # (!\pila:stack_ptr[29]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[29]~q\,
	datad => VCC,
	cin => \Add0~57\,
	combout => \Add0~58_combout\,
	cout => \Add0~59\);

-- Location: LCCOMB_X65_Y58_N28
\Add1~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~60_combout\ = (\Add0~60_combout\ & (\Add1~59\ $ (GND))) # (!\Add0~60_combout\ & (!\Add1~59\ & VCC))
-- \Add1~61\ = CARRY((\Add0~60_combout\ & !\Add1~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add0~60_combout\,
	datad => VCC,
	cin => \Add1~59\,
	combout => \Add1~60_combout\,
	cout => \Add1~61\);

-- Location: LCCOMB_X68_Y59_N0
\pila:stack_ptr[30]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[30]~0_combout\ = (\pila~0_combout\ & ((\Add1~60_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[30]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[30]~q\,
	datac => \pila~0_combout\,
	datad => \Add1~60_combout\,
	combout => \pila:stack_ptr[30]~0_combout\);

-- Location: LCCOMB_X68_Y59_N28
\pila:stack_ptr[30]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[30]~feeder_combout\ = \pila:stack_ptr[30]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pila:stack_ptr[30]~0_combout\,
	combout => \pila:stack_ptr[30]~feeder_combout\);

-- Location: LCCOMB_X69_Y60_N28
\Add3~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~62_combout\ = (\Add2~60_combout\ & ((GND) # (!\Add3~61\))) # (!\Add2~60_combout\ & (\Add3~61\ $ (GND)))
-- \Add3~63\ = CARRY((\Add2~60_combout\) # (!\Add3~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add2~60_combout\,
	datad => VCC,
	cin => \Add3~61\,
	combout => \Add3~62_combout\,
	cout => \Add3~63\);

-- Location: LCCOMB_X68_Y59_N22
\Add3~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~67_combout\ = (!\Equal3~10_combout\ & \Add3~62_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal3~10_combout\,
	datad => \Add3~62_combout\,
	combout => \Add3~67_combout\);

-- Location: FF_X68_Y59_N29
\pila:stack_ptr[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[30]~feeder_combout\,
	asdata => \Add3~67_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[30]~q\);

-- Location: LCCOMB_X66_Y58_N28
\Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~60_combout\ = (\pila:stack_ptr[30]~q\ & (\Add0~59\ $ (GND))) # (!\pila:stack_ptr[30]~q\ & (!\Add0~59\ & VCC))
-- \Add0~61\ = CARRY((\pila:stack_ptr[30]~q\ & !\Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[30]~q\,
	datad => VCC,
	cin => \Add0~59\,
	combout => \Add0~60_combout\,
	cout => \Add0~61\);

-- Location: LCCOMB_X65_Y58_N30
\Add1~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~62_combout\ = \Add0~62_combout\ $ (\Add1~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~62_combout\,
	cin => \Add1~61\,
	combout => \Add1~62_combout\);

-- Location: LCCOMB_X67_Y60_N26
\pila:stack_ptr[31]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[31]~0_combout\ = (\pila~0_combout\ & (\Add1~62_combout\)) # (!\pila~0_combout\ & ((\pila:stack_ptr[31]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~62_combout\,
	datac => \pila~0_combout\,
	datad => \pila:stack_ptr[31]~q\,
	combout => \pila:stack_ptr[31]~0_combout\);

-- Location: LCCOMB_X67_Y60_N24
\pila:stack_ptr[31]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[31]~feeder_combout\ = \pila:stack_ptr[31]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[31]~0_combout\,
	combout => \pila:stack_ptr[31]~feeder_combout\);

-- Location: LCCOMB_X69_Y60_N30
\Add3~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~64_combout\ = \Add3~63\ $ (!\Add2~62_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Add2~62_combout\,
	cin => \Add3~63\,
	combout => \Add3~64_combout\);

-- Location: LCCOMB_X67_Y60_N22
\Add3~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~66_combout\ = (!\Equal3~10_combout\ & \Add3~64_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal3~10_combout\,
	datad => \Add3~64_combout\,
	combout => \Add3~66_combout\);

-- Location: FF_X67_Y60_N25
\pila:stack_ptr[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[31]~feeder_combout\,
	asdata => \Add3~66_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[31]~q\);

-- Location: LCCOMB_X66_Y58_N30
\Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~62_combout\ = \Add0~61\ $ (\pila:stack_ptr[31]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \pila:stack_ptr[31]~q\,
	cin => \Add0~61\,
	combout => \Add0~62_combout\);

-- Location: LCCOMB_X67_Y58_N0
\stack_ptr~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_ptr~2_combout\ = (\Add0~44_combout\) # ((\Add0~54_combout\) # ((\Add0~48_combout\) # (\Add0~56_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~44_combout\,
	datab => \Add0~54_combout\,
	datac => \Add0~48_combout\,
	datad => \Add0~56_combout\,
	combout => \stack_ptr~2_combout\);

-- Location: LCCOMB_X67_Y58_N14
\Equal1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~5_combout\ = (!\Add0~32_combout\ & (!\Add0~36_combout\ & (!\Add0~38_combout\ & !\Add0~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~32_combout\,
	datab => \Add0~36_combout\,
	datac => \Add0~38_combout\,
	datad => \Add0~34_combout\,
	combout => \Equal1~5_combout\);

-- Location: LCCOMB_X67_Y58_N30
\Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (!\Add0~14_combout\ & (!\Add0~8_combout\ & (\Add0~12_combout\ & \Add0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~14_combout\,
	datab => \Add0~8_combout\,
	datac => \Add0~12_combout\,
	datad => \Add0~10_combout\,
	combout => \Equal1~1_combout\);

-- Location: LCCOMB_X67_Y58_N28
\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!\Add0~0_combout\ & (!\Add0~2_combout\ & (!\Add0~6_combout\ & \Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Add0~2_combout\,
	datac => \Add0~6_combout\,
	datad => \Add0~4_combout\,
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X67_Y58_N8
\Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = (!\Add0~16_combout\ & (!\Add0~22_combout\ & (!\Add0~20_combout\ & !\Add0~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datab => \Add0~22_combout\,
	datac => \Add0~20_combout\,
	datad => \Add0~18_combout\,
	combout => \Equal1~2_combout\);

-- Location: LCCOMB_X67_Y58_N18
\Equal1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~3_combout\ = (!\Add0~30_combout\ & (!\Add0~24_combout\ & (!\Add0~28_combout\ & !\Add0~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~30_combout\,
	datab => \Add0~24_combout\,
	datac => \Add0~28_combout\,
	datad => \Add0~26_combout\,
	combout => \Equal1~3_combout\);

-- Location: LCCOMB_X67_Y58_N20
\Equal1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~4_combout\ = (\Equal1~1_combout\ & (\Equal1~0_combout\ & (\Equal1~2_combout\ & \Equal1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => \Equal1~0_combout\,
	datac => \Equal1~2_combout\,
	datad => \Equal1~3_combout\,
	combout => \Equal1~4_combout\);

-- Location: LCCOMB_X67_Y58_N4
\stack_ptr~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_ptr~0_combout\ = (\Add0~40_combout\) # ((\Add0~42_combout\) # ((!\Equal1~4_combout\) # (!\Equal1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~40_combout\,
	datab => \Add0~42_combout\,
	datac => \Equal1~5_combout\,
	datad => \Equal1~4_combout\,
	combout => \stack_ptr~0_combout\);

-- Location: LCCOMB_X67_Y58_N6
\stack_ptr~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_ptr~1_combout\ = (\Add0~52_combout\) # ((\Add0~58_combout\) # (\Add0~50_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~52_combout\,
	datac => \Add0~58_combout\,
	datad => \Add0~50_combout\,
	combout => \stack_ptr~1_combout\);

-- Location: LCCOMB_X67_Y58_N10
\stack_ptr~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_ptr~3_combout\ = (\Add0~46_combout\) # ((\stack_ptr~2_combout\) # ((\stack_ptr~0_combout\) # (\stack_ptr~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~46_combout\,
	datab => \stack_ptr~2_combout\,
	datac => \stack_ptr~0_combout\,
	datad => \stack_ptr~1_combout\,
	combout => \stack_ptr~3_combout\);

-- Location: LCCOMB_X67_Y58_N12
\stack_ptr~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_ptr~4_combout\ = (\Add1~0_combout\ & ((\Add0~62_combout\) # ((\Add0~60_combout\) # (\stack_ptr~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \Add0~62_combout\,
	datac => \Add0~60_combout\,
	datad => \stack_ptr~3_combout\,
	combout => \stack_ptr~4_combout\);

-- Location: LCCOMB_X67_Y58_N22
\pila:stack_ptr[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[0]~0_combout\ = (\pila~0_combout\ & ((\stack_ptr~4_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[0]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[0]~q\,
	datac => \pila~0_combout\,
	datad => \stack_ptr~4_combout\,
	combout => \pila:stack_ptr[0]~0_combout\);

-- Location: LCCOMB_X67_Y58_N24
\pila:stack_ptr[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[0]~feeder_combout\ = \pila:stack_ptr[0]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[0]~0_combout\,
	combout => \pila:stack_ptr[0]~feeder_combout\);

-- Location: LCCOMB_X68_Y58_N10
\Add3~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~95_combout\ = (\Add3~0_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~0_combout\,
	datac => \Equal3~10_combout\,
	combout => \Add3~95_combout\);

-- Location: FF_X67_Y58_N25
\pila:stack_ptr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[0]~feeder_combout\,
	asdata => \Add3~95_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[0]~q\);

-- Location: LCCOMB_X66_Y59_N2
\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\pila:stack_ptr[1]~q\ & (!\Add0~1\)) # (!\pila:stack_ptr[1]~q\ & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!\pila:stack_ptr[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[1]~q\,
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X66_Y60_N30
\pila:stack_ptr[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[1]~0_combout\ = (\pila~0_combout\ & ((\Add1~2_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~0_combout\,
	datac => \pila:stack_ptr[1]~q\,
	datad => \Add1~2_combout\,
	combout => \pila:stack_ptr[1]~0_combout\);

-- Location: LCCOMB_X66_Y60_N22
\Add3~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~94_combout\ = (!\Equal3~10_combout\ & \Add3~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal3~10_combout\,
	datad => \Add3~2_combout\,
	combout => \Add3~94_combout\);

-- Location: FF_X66_Y60_N31
\pila:stack_ptr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[1]~0_combout\,
	asdata => \Add3~94_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[1]~q\);

-- Location: LCCOMB_X66_Y59_N4
\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (\pila:stack_ptr[2]~q\ & (!\Add0~3\ & VCC)) # (!\pila:stack_ptr[2]~q\ & (\Add0~3\ $ (GND)))
-- \Add0~5\ = CARRY((!\pila:stack_ptr[2]~q\ & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[2]~q\,
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X68_Y59_N20
\stack_ptr~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_ptr~5_combout\ = (\pila~0_combout\ & ((\Add1~4_combout\))) # (!\pila~0_combout\ & (!\pila:stack_ptr[2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[2]~q\,
	datac => \pila~0_combout\,
	datad => \Add1~4_combout\,
	combout => \stack_ptr~5_combout\);

-- Location: LCCOMB_X67_Y59_N12
\Add3~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~13_combout\ = (\pila~1_combout\ & (((\Equal3~10_combout\) # (!\Add3~4_combout\)))) # (!\pila~1_combout\ & (!\stack_ptr~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_ptr~5_combout\,
	datab => \pila~1_combout\,
	datac => \Add3~4_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~13_combout\);

-- Location: FF_X67_Y59_N13
\pila:stack_ptr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add3~13_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[2]~q\);

-- Location: LCCOMB_X66_Y59_N6
\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\pila:stack_ptr[3]~q\ & (!\Add0~5\)) # (!\pila:stack_ptr[3]~q\ & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!\pila:stack_ptr[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[3]~q\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X67_Y59_N24
\pila:stack_ptr[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[3]~0_combout\ = (\pila~0_combout\ & ((\Add1~6_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila~0_combout\,
	datac => \pila:stack_ptr[3]~q\,
	datad => \Add1~6_combout\,
	combout => \pila:stack_ptr[3]~0_combout\);

-- Location: LCCOMB_X67_Y59_N14
\Add3~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~93_combout\ = (\Add3~6_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~6_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~93_combout\);

-- Location: FF_X67_Y59_N25
\pila:stack_ptr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[3]~0_combout\,
	asdata => \Add3~93_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[3]~q\);

-- Location: LCCOMB_X66_Y59_N8
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (\pila:stack_ptr[4]~q\ & (\Add0~7\ $ (GND))) # (!\pila:stack_ptr[4]~q\ & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((\pila:stack_ptr[4]~q\ & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[4]~q\,
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X67_Y59_N26
\pila:stack_ptr[4]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila:stack_ptr[4]~0_combout\ = (\pila~0_combout\ & ((\Add1~8_combout\))) # (!\pila~0_combout\ & (\pila:stack_ptr[4]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila~0_combout\,
	datac => \pila:stack_ptr[4]~q\,
	datad => \Add1~8_combout\,
	combout => \pila:stack_ptr[4]~0_combout\);

-- Location: LCCOMB_X67_Y59_N4
\Add3~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~92_combout\ = (\Add3~8_combout\ & !\Equal3~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add3~8_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~92_combout\);

-- Location: FF_X67_Y59_N27
\pila:stack_ptr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pila:stack_ptr[4]~0_combout\,
	asdata => \Add3~92_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sload => \pila~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[4]~q\);

-- Location: LCCOMB_X66_Y59_N10
\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (\pila:stack_ptr[5]~q\ & ((\Add0~9\) # (GND))) # (!\pila:stack_ptr[5]~q\ & (!\Add0~9\))
-- \Add0~11\ = CARRY((\pila:stack_ptr[5]~q\) # (!\Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[5]~q\,
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X68_Y59_N6
\stack_ptr~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_ptr~6_combout\ = (\pila~0_combout\ & ((\Add1~10_combout\))) # (!\pila~0_combout\ & (!\pila:stack_ptr[5]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[5]~q\,
	datac => \pila~0_combout\,
	datad => \Add1~10_combout\,
	combout => \stack_ptr~6_combout\);

-- Location: LCCOMB_X67_Y59_N2
\Add3~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~12_combout\ = (\pila~1_combout\ & (((\Equal3~10_combout\) # (!\Add3~10_combout\)))) # (!\pila~1_combout\ & (!\stack_ptr~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_ptr~6_combout\,
	datab => \pila~1_combout\,
	datac => \Add3~10_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~12_combout\);

-- Location: FF_X67_Y59_N3
\pila:stack_ptr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add3~12_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[5]~q\);

-- Location: LCCOMB_X68_Y59_N16
\stack_ptr~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_ptr~7_combout\ = (\pila~0_combout\ & ((\Add1~12_combout\))) # (!\pila~0_combout\ & (!\pila:stack_ptr[6]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[6]~q\,
	datac => \pila~0_combout\,
	datad => \Add1~12_combout\,
	combout => \stack_ptr~7_combout\);

-- Location: LCCOMB_X67_Y59_N6
\Add3~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~68_combout\ = (\pila~1_combout\ & (((\Equal3~10_combout\) # (!\Add3~14_combout\)))) # (!\pila~1_combout\ & (!\stack_ptr~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_ptr~7_combout\,
	datab => \pila~1_combout\,
	datac => \Add3~14_combout\,
	datad => \Equal3~10_combout\,
	combout => \Add3~68_combout\);

-- Location: FF_X67_Y59_N7
\pila:stack_ptr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add3~68_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pila:stack_ptr[6]~q\);

-- Location: LCCOMB_X65_Y63_N10
\full~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~0_combout\ = (\PUSH_barPOP~input_o\ & (\pila:stack_ptr[6]~q\ & (\Enable~input_o\ & \pila:stack_ptr[5]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PUSH_barPOP~input_o\,
	datab => \pila:stack_ptr[6]~q\,
	datac => \Enable~input_o\,
	datad => \pila:stack_ptr[5]~q\,
	combout => \full~0_combout\);

-- Location: LCCOMB_X65_Y60_N12
\full~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~3_combout\ = (!\pila:stack_ptr[21]~0_combout\ & (!\pila:stack_ptr[24]~0_combout\ & (!\pila:stack_ptr[22]~0_combout\ & !\pila:stack_ptr[23]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[21]~0_combout\,
	datab => \pila:stack_ptr[24]~0_combout\,
	datac => \pila:stack_ptr[22]~0_combout\,
	datad => \pila:stack_ptr[23]~0_combout\,
	combout => \full~3_combout\);

-- Location: LCCOMB_X66_Y60_N10
\full~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~2_combout\ = (!\pila:stack_ptr[28]~0_combout\ & (!\pila:stack_ptr[25]~0_combout\ & (!\pila:stack_ptr[27]~0_combout\ & !\pila:stack_ptr[26]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[28]~0_combout\,
	datab => \pila:stack_ptr[25]~0_combout\,
	datac => \pila:stack_ptr[27]~0_combout\,
	datad => \pila:stack_ptr[26]~0_combout\,
	combout => \full~2_combout\);

-- Location: LCCOMB_X68_Y59_N18
\full~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~1_combout\ = (\pila:stack_ptr[2]~q\ & (!\pila:stack_ptr[29]~0_combout\ & (!\pila:stack_ptr[31]~0_combout\ & !\pila:stack_ptr[30]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[2]~q\,
	datab => \pila:stack_ptr[29]~0_combout\,
	datac => \pila:stack_ptr[31]~0_combout\,
	datad => \pila:stack_ptr[30]~0_combout\,
	combout => \full~1_combout\);

-- Location: LCCOMB_X65_Y63_N20
\full~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~4_combout\ = (\full~0_combout\ & (\full~3_combout\ & (\full~2_combout\ & \full~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \full~0_combout\,
	datab => \full~3_combout\,
	datac => \full~2_combout\,
	datad => \full~1_combout\,
	combout => \full~4_combout\);

-- Location: LCCOMB_X65_Y60_N6
\full~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~5_combout\ = (!\pila:stack_ptr[19]~0_combout\ & (!\pila:stack_ptr[18]~0_combout\ & (!\pila:stack_ptr[20]~0_combout\ & !\pila:stack_ptr[17]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[19]~0_combout\,
	datab => \pila:stack_ptr[18]~0_combout\,
	datac => \pila:stack_ptr[20]~0_combout\,
	datad => \pila:stack_ptr[17]~0_combout\,
	combout => \full~5_combout\);

-- Location: LCCOMB_X67_Y59_N0
\full~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~8_combout\ = (!\pila:stack_ptr[8]~0_combout\ & (!\pila:stack_ptr[3]~0_combout\ & (!\pila:stack_ptr[4]~0_combout\ & !\pila:stack_ptr[7]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[8]~0_combout\,
	datab => \pila:stack_ptr[3]~0_combout\,
	datac => \pila:stack_ptr[4]~0_combout\,
	datad => \pila:stack_ptr[7]~0_combout\,
	combout => \full~8_combout\);

-- Location: LCCOMB_X67_Y61_N0
\full~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~6_combout\ = (!\pila:stack_ptr[15]~0_combout\ & (!\pila:stack_ptr[13]~0_combout\ & (!\pila:stack_ptr[16]~0_combout\ & !\pila:stack_ptr[14]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[15]~0_combout\,
	datab => \pila:stack_ptr[13]~0_combout\,
	datac => \pila:stack_ptr[16]~0_combout\,
	datad => \pila:stack_ptr[14]~0_combout\,
	combout => \full~6_combout\);

-- Location: LCCOMB_X66_Y61_N6
\full~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~7_combout\ = (!\pila:stack_ptr[12]~0_combout\ & (!\pila:stack_ptr[11]~0_combout\ & (!\pila:stack_ptr[9]~0_combout\ & !\pila:stack_ptr[10]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[12]~0_combout\,
	datab => \pila:stack_ptr[11]~0_combout\,
	datac => \pila:stack_ptr[9]~0_combout\,
	datad => \pila:stack_ptr[10]~0_combout\,
	combout => \full~7_combout\);

-- Location: LCCOMB_X66_Y61_N24
\full~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~9_combout\ = (\full~5_combout\ & (\full~8_combout\ & (\full~6_combout\ & \full~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \full~5_combout\,
	datab => \full~8_combout\,
	datac => \full~6_combout\,
	datad => \full~7_combout\,
	combout => \full~9_combout\);

-- Location: LCCOMB_X66_Y61_N10
\full~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~10_combout\ = (!\pila:stack_ptr[0]~0_combout\ & (!\pila:stack_ptr[1]~0_combout\ & \full~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pila:stack_ptr[0]~0_combout\,
	datac => \pila:stack_ptr[1]~0_combout\,
	datad => \full~9_combout\,
	combout => \full~10_combout\);

-- Location: LCCOMB_X65_Y63_N16
\full~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \full~11_combout\ = (\pila~0_combout\ & (\full~4_combout\ & ((\full~10_combout\)))) # (!\pila~0_combout\ & ((\full~q\) # ((\full~4_combout\ & \full~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~0_combout\,
	datab => \full~4_combout\,
	datac => \full~q\,
	datad => \full~10_combout\,
	combout => \full~11_combout\);

-- Location: FF_X65_Y63_N17
full : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \full~11_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \full~q\);

-- Location: LCCOMB_X65_Y63_N24
\pila~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \pila~1_combout\ = (!\full~q\ & (\Enable~input_o\ & \PUSH_barPOP~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \full~q\,
	datac => \Enable~input_o\,
	datad => \PUSH_barPOP~input_o\,
	combout => \pila~1_combout\);

-- Location: LCCOMB_X68_Y59_N24
\empty~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~0_combout\ = (!\pila:stack_ptr[5]~q\ & (!\pila:stack_ptr[30]~q\ & (!\pila:stack_ptr[31]~q\ & !\pila:stack_ptr[2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[5]~q\,
	datab => \pila:stack_ptr[30]~q\,
	datac => \pila:stack_ptr[31]~q\,
	datad => \pila:stack_ptr[2]~q\,
	combout => \empty~0_combout\);

-- Location: LCCOMB_X68_Y59_N14
\empty~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~1_combout\ = (!\pila~1_combout\ & (!\pila:stack_ptr[6]~q\ & (\pila~0_combout\ & \empty~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~1_combout\,
	datab => \pila:stack_ptr[6]~q\,
	datac => \pila~0_combout\,
	datad => \empty~0_combout\,
	combout => \empty~1_combout\);

-- Location: LCCOMB_X65_Y60_N14
\empty~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~4_combout\ = (!\pila:stack_ptr[21]~q\ & (!\pila:stack_ptr[20]~q\ & (!\pila:stack_ptr[18]~q\ & !\pila:stack_ptr[19]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[21]~q\,
	datab => \pila:stack_ptr[20]~q\,
	datac => \pila:stack_ptr[18]~q\,
	datad => \pila:stack_ptr[19]~q\,
	combout => \empty~4_combout\);

-- Location: LCCOMB_X66_Y60_N18
\empty~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~2_combout\ = (!\pila:stack_ptr[26]~q\ & (!\pila:stack_ptr[28]~q\ & (!\pila:stack_ptr[29]~q\ & !\pila:stack_ptr[27]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[26]~q\,
	datab => \pila:stack_ptr[28]~q\,
	datac => \pila:stack_ptr[29]~q\,
	datad => \pila:stack_ptr[27]~q\,
	combout => \empty~2_combout\);

-- Location: LCCOMB_X67_Y61_N12
\empty~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~5_combout\ = (!\pila:stack_ptr[17]~q\ & (!\pila:stack_ptr[15]~q\ & (!\pila:stack_ptr[16]~q\ & !\pila:stack_ptr[14]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[17]~q\,
	datab => \pila:stack_ptr[15]~q\,
	datac => \pila:stack_ptr[16]~q\,
	datad => \pila:stack_ptr[14]~q\,
	combout => \empty~5_combout\);

-- Location: LCCOMB_X68_Y59_N12
\empty~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~3_combout\ = (!\pila:stack_ptr[25]~q\ & (!\pila:stack_ptr[23]~q\ & (!\pila:stack_ptr[24]~q\ & !\pila:stack_ptr[22]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[25]~q\,
	datab => \pila:stack_ptr[23]~q\,
	datac => \pila:stack_ptr[24]~q\,
	datad => \pila:stack_ptr[22]~q\,
	combout => \empty~3_combout\);

-- Location: LCCOMB_X66_Y60_N0
\empty~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~6_combout\ = (\empty~4_combout\ & (\empty~2_combout\ & (\empty~5_combout\ & \empty~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \empty~4_combout\,
	datab => \empty~2_combout\,
	datac => \empty~5_combout\,
	datad => \empty~3_combout\,
	combout => \empty~6_combout\);

-- Location: LCCOMB_X67_Y59_N20
\empty~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~8_combout\ = (!\pila:stack_ptr[8]~q\ & (!\pila:stack_ptr[7]~q\ & (!\pila:stack_ptr[9]~q\ & !\pila:stack_ptr[4]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[8]~q\,
	datab => \pila:stack_ptr[7]~q\,
	datac => \pila:stack_ptr[9]~q\,
	datad => \pila:stack_ptr[4]~q\,
	combout => \empty~8_combout\);

-- Location: LCCOMB_X67_Y59_N18
\empty~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~9_combout\ = (!\pila:stack_ptr[0]~q\ & (!\pila:stack_ptr[3]~q\ & (!\pila:stack_ptr[1]~q\ & \empty~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[0]~q\,
	datab => \pila:stack_ptr[3]~q\,
	datac => \pila:stack_ptr[1]~q\,
	datad => \empty~8_combout\,
	combout => \empty~9_combout\);

-- Location: LCCOMB_X66_Y61_N20
\empty~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~7_combout\ = (!\pila:stack_ptr[12]~q\ & (!\pila:stack_ptr[10]~q\ & (!\pila:stack_ptr[11]~q\ & !\pila:stack_ptr[13]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila:stack_ptr[12]~q\,
	datab => \pila:stack_ptr[10]~q\,
	datac => \pila:stack_ptr[11]~q\,
	datad => \pila:stack_ptr[13]~q\,
	combout => \empty~7_combout\);

-- Location: LCCOMB_X67_Y61_N6
\empty~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~10_combout\ = (\empty~1_combout\ & (\empty~6_combout\ & (\empty~9_combout\ & \empty~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \empty~1_combout\,
	datab => \empty~6_combout\,
	datac => \empty~9_combout\,
	datad => \empty~7_combout\,
	combout => \empty~10_combout\);

-- Location: LCCOMB_X66_Y61_N28
\empty~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \empty~11_combout\ = (\empty~10_combout\) # ((!\pila~1_combout\ & (!\pila~0_combout\ & \empty~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pila~1_combout\,
	datab => \pila~0_combout\,
	datac => \empty~q\,
	datad => \empty~10_combout\,
	combout => \empty~11_combout\);

-- Location: FF_X66_Y61_N29
empty : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \empty~11_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \empty~q\);

-- Location: LCCOMB_X65_Y63_N30
\stack_mem~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_mem~25_combout\ = (\stack_mem~16_q\) # ((!\PUSH_barPOP~input_o\ & (\Enable~input_o\ & !\empty~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PUSH_barPOP~input_o\,
	datab => \Enable~input_o\,
	datac => \stack_mem~16_q\,
	datad => \empty~q\,
	combout => \stack_mem~25_combout\);

-- Location: FF_X65_Y63_N31
\stack_mem~16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stack_mem~25_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stack_mem~16_q\);

-- Location: LCCOMB_X65_Y63_N26
\stack_mem~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_mem~26_combout\ = (!\full~q\ & (!\Reset~input_o\ & (\Enable~input_o\ & \PUSH_barPOP~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \full~q\,
	datab => \Reset~input_o\,
	datac => \Enable~input_o\,
	datad => \PUSH_barPOP~input_o\,
	combout => \stack_mem~26_combout\);

-- Location: M9K_X64_Y67_N0
\stack_mem_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/Pila.ram0_Pila_29eaf5.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:stack_mem_rtl_0|altsyncram_llh1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 7,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 36,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 127,
	port_a_logical_ram_depth => 101,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 7,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 36,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 127,
	port_b_logical_ram_depth => 101,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \stack_mem~26_combout\,
	portbre => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	clk1 => \clk~inputclkctrl_outclk\,
	ena0 => \stack_mem~26_combout\,
	ena1 => \pila~0_combout\,
	portadatain => \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \stack_mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X66_Y67_N2
\stack_mem~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_mem~20_combout\ = (\stack_mem~16_q\ & \stack_mem_rtl_0|auto_generated|ram_block1a3\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \stack_mem~16_q\,
	datad => \stack_mem_rtl_0|auto_generated|ram_block1a3\,
	combout => \stack_mem~20_combout\);

-- Location: LCCOMB_X65_Y67_N16
\stack_mem~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_mem~17_combout\ = (\stack_mem~16_q\ & \stack_mem_rtl_0|auto_generated|ram_block1a5\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \stack_mem~16_q\,
	datad => \stack_mem_rtl_0|auto_generated|ram_block1a5\,
	combout => \stack_mem~17_combout\);

-- Location: LCCOMB_X65_Y67_N26
\stack_mem~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_mem~18_combout\ = (\stack_mem~16_q\ & \stack_mem_rtl_0|auto_generated|ram_block1a4\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \stack_mem~16_q\,
	datad => \stack_mem_rtl_0|auto_generated|ram_block1a4\,
	combout => \stack_mem~18_combout\);

-- Location: LCCOMB_X66_Y67_N10
\stack_mem~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_mem~19_combout\ = (\stack_mem~16_q\ & \stack_mem_rtl_0|auto_generated|ram_block1a6\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem~16_q\,
	datad => \stack_mem_rtl_0|auto_generated|ram_block1a6\,
	combout => \stack_mem~19_combout\);

-- Location: LCCOMB_X66_Y67_N0
\Mux39~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~0_combout\ = (\LCD:contador2[0]~q\ & (\LCD:contador2[1]~q\)) # (!\LCD:contador2[0]~q\ & ((\LCD:contador2[1]~q\ & (\stack_mem~18_combout\)) # (!\LCD:contador2[1]~q\ & ((\stack_mem~19_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \stack_mem~18_combout\,
	datad => \stack_mem~19_combout\,
	combout => \Mux39~0_combout\);

-- Location: LCCOMB_X66_Y67_N8
\Mux39~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~1_combout\ = (\LCD:contador2[0]~q\ & ((\Mux39~0_combout\ & (\stack_mem~20_combout\)) # (!\Mux39~0_combout\ & ((\stack_mem~17_combout\))))) # (!\LCD:contador2[0]~q\ & (((\Mux39~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \stack_mem~20_combout\,
	datac => \stack_mem~17_combout\,
	datad => \Mux39~0_combout\,
	combout => \Mux39~1_combout\);

-- Location: LCCOMB_X66_Y67_N4
\Mux39~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~4_combout\ = (\LCD:contador2[0]~q\ & (((\stack_mem~16_q\ & \stack_mem_rtl_0|auto_generated|ram_block1a7\)) # (!\LCD:contador2[1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \stack_mem~16_q\,
	datac => \stack_mem_rtl_0|auto_generated|ram_block1a7\,
	datad => \LCD:contador2[1]~q\,
	combout => \Mux39~4_combout\);

-- Location: LCCOMB_X66_Y67_N30
\Mux39~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~2_combout\ = (\stack_mem~16_q\ & ((\LCD:contador2[1]~q\ & (\stack_mem_rtl_0|auto_generated|ram_block1a0~portbdataout\)) # (!\LCD:contador2[1]~q\ & ((\stack_mem_rtl_0|auto_generated|ram_block1a2\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	datab => \stack_mem~16_q\,
	datac => \stack_mem_rtl_0|auto_generated|ram_block1a2\,
	datad => \LCD:contador2[1]~q\,
	combout => \Mux39~2_combout\);

-- Location: LCCOMB_X66_Y67_N20
\stack_mem~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_mem~21_combout\ = (\stack_mem~16_q\ & \stack_mem_rtl_0|auto_generated|ram_block1a1\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \stack_mem~16_q\,
	datad => \stack_mem_rtl_0|auto_generated|ram_block1a1\,
	combout => \stack_mem~21_combout\);

-- Location: LCCOMB_X66_Y67_N18
\Mux39~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~3_combout\ = (\LCD:contador2[0]~q\ & (!\LCD:contador2[1]~q\ & ((\stack_mem~21_combout\)))) # (!\LCD:contador2[0]~q\ & (((\Mux39~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \Mux39~2_combout\,
	datad => \stack_mem~21_combout\,
	combout => \Mux39~3_combout\);

-- Location: LCCOMB_X66_Y67_N14
\Mux39~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~5_combout\ = (\LCD:contador2[2]~q\ & (((\LCD:contador2[3]~q\)))) # (!\LCD:contador2[2]~q\ & ((\LCD:contador2[3]~q\ & ((\Mux39~3_combout\))) # (!\LCD:contador2[3]~q\ & (\Mux39~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \Mux39~4_combout\,
	datac => \LCD:contador2[3]~q\,
	datad => \Mux39~3_combout\,
	combout => \Mux39~5_combout\);

-- Location: LCCOMB_X65_Y67_N12
\stack_mem~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_mem~23_combout\ = (\stack_mem~16_q\ & \stack_mem_rtl_0|auto_generated|ram_block1a0~portbdataout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \stack_mem~16_q\,
	datad => \stack_mem_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	combout => \stack_mem~23_combout\);

-- Location: LCCOMB_X65_Y67_N14
\stack_mem~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_mem~24_combout\ = (\stack_mem~16_q\ & \stack_mem_rtl_0|auto_generated|ram_block1a2\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem~16_q\,
	datac => \stack_mem_rtl_0|auto_generated|ram_block1a2\,
	combout => \stack_mem~24_combout\);

-- Location: LCCOMB_X66_Y67_N22
\Mux25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux25~0_combout\ = \stack_mem~23_combout\ $ (((\stack_mem~20_combout\ & ((\stack_mem~21_combout\) # (\stack_mem~24_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem~23_combout\,
	datab => \stack_mem~21_combout\,
	datac => \stack_mem~20_combout\,
	datad => \stack_mem~24_combout\,
	combout => \Mux25~0_combout\);

-- Location: LCCOMB_X63_Y67_N0
\stack_mem~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \stack_mem~22_combout\ = (\stack_mem~16_q\ & \stack_mem_rtl_0|auto_generated|ram_block1a7\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \stack_mem~16_q\,
	datad => \stack_mem_rtl_0|auto_generated|ram_block1a7\,
	combout => \stack_mem~22_combout\);

-- Location: LCCOMB_X66_Y67_N12
\Mux31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux31~0_combout\ = \stack_mem~18_combout\ $ (((\stack_mem~22_combout\ & ((\stack_mem~19_combout\) # (\stack_mem~17_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem~19_combout\,
	datab => \stack_mem~17_combout\,
	datac => \stack_mem~18_combout\,
	datad => \stack_mem~22_combout\,
	combout => \Mux31~0_combout\);

-- Location: LCCOMB_X66_Y67_N24
\Mux39~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~6_combout\ = (\LCD:contador2[0]~q\ & (!\LCD:contador2[1]~q\ & ((\Mux31~0_combout\)))) # (!\LCD:contador2[0]~q\ & (\LCD:contador2[1]~q\ & (\Mux25~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \Mux25~0_combout\,
	datad => \Mux31~0_combout\,
	combout => \Mux39~6_combout\);

-- Location: LCCOMB_X66_Y67_N6
\Mux39~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux39~7_combout\ = (\LCD:contador2[2]~q\ & ((\Mux39~5_combout\ & ((\Mux39~6_combout\))) # (!\Mux39~5_combout\ & (\Mux39~1_combout\)))) # (!\LCD:contador2[2]~q\ & (((\Mux39~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \Mux39~1_combout\,
	datac => \Mux39~5_combout\,
	datad => \Mux39~6_combout\,
	combout => \Mux39~7_combout\);

-- Location: LCCOMB_X66_Y67_N16
\Selector8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~1_combout\ = (\current_state.D_ON~q\) # ((\current_state.LCD_CLR~q\) # ((\Selector22~0_combout\ & \Mux39~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.D_ON~q\,
	datab => \current_state.LCD_CLR~q\,
	datac => \Selector22~0_combout\,
	datad => \Mux39~7_combout\,
	combout => \Selector8~1_combout\);

-- Location: LCCOMB_X66_Y67_N28
\Selector8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~2_combout\ = (\Selector8~0_combout\) # ((\Selector8~1_combout\) # ((\current_state.MESG1~q\ & \Datos~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG1~q\,
	datab => \Selector8~0_combout\,
	datac => \Datos~4_combout\,
	datad => \Selector8~1_combout\,
	combout => \Selector8~2_combout\);

-- Location: FF_X66_Y67_N29
\Datos[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector8~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Datos[0]~reg0_q\);

-- Location: LCCOMB_X66_Y68_N22
\Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (!\LCD:contador2[1]~q\ & (!\LCD:contador2[0]~q\ & (!\LCD:contador2[3]~q\ & !\LCD:contador2[2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[1]~q\,
	datab => \LCD:contador2[0]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \LCD:contador2[2]~q\,
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X66_Y68_N8
\Selector7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~1_combout\ = (\Selector7~0_combout\ & ((\current_state.MESG2~q\) # ((\current_state.MESG1~q\ & \LCD:numMen~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG1~q\,
	datab => \current_state.MESG2~q\,
	datac => \Selector7~0_combout\,
	datad => \LCD:numMen~q\,
	combout => \Selector7~1_combout\);

-- Location: LCCOMB_X65_Y68_N30
\Selector7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~2_combout\ = (\current_state.MESG1~q\ & ((\LCD:contador2[2]~q\) # (\LCD:contador2[1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datac => \current_state.MESG1~q\,
	datad => \LCD:contador2[1]~q\,
	combout => \Selector7~2_combout\);

-- Location: LCCOMB_X65_Y67_N30
\Mux24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux24~0_combout\ = (\stack_mem~23_combout\ & (((\stack_mem~21_combout\)))) # (!\stack_mem~23_combout\ & ((\stack_mem~21_combout\ & ((!\stack_mem~20_combout\))) # (!\stack_mem~21_combout\ & (\stack_mem~24_combout\ & \stack_mem~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem~23_combout\,
	datab => \stack_mem~24_combout\,
	datac => \stack_mem~21_combout\,
	datad => \stack_mem~20_combout\,
	combout => \Mux24~0_combout\);

-- Location: LCCOMB_X65_Y67_N20
\Mux30~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux30~0_combout\ = (\stack_mem~18_combout\ & (\stack_mem~17_combout\)) # (!\stack_mem~18_combout\ & ((\stack_mem~17_combout\ & (!\stack_mem~22_combout\)) # (!\stack_mem~17_combout\ & (\stack_mem~22_combout\ & \stack_mem~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem~18_combout\,
	datab => \stack_mem~17_combout\,
	datac => \stack_mem~22_combout\,
	datad => \stack_mem~19_combout\,
	combout => \Mux30~0_combout\);

-- Location: LCCOMB_X65_Y67_N28
\Selector7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~3_combout\ = (\LCD:contador2[0]~q\ & ((\LCD:contador2[1]~q\) # ((\Mux30~0_combout\)))) # (!\LCD:contador2[0]~q\ & (\LCD:contador2[1]~q\ & (\Mux24~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \Mux24~0_combout\,
	datad => \Mux30~0_combout\,
	combout => \Selector7~3_combout\);

-- Location: LCCOMB_X65_Y67_N18
\Selector7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~4_combout\ = (\Selector7~2_combout\) # ((\current_state.MESG2~q\ & (\LCD:contador2[2]~q\ & \Selector7~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG2~q\,
	datab => \LCD:contador2[2]~q\,
	datac => \Selector7~2_combout\,
	datad => \Selector7~3_combout\,
	combout => \Selector7~4_combout\);

-- Location: LCCOMB_X65_Y67_N0
\Selector7~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~5_combout\ = (!\LessThan2~0_combout\ & ((\Selector7~1_combout\) # ((\LCD:contador2[3]~q\ & \Selector7~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~0_combout\,
	datab => \Selector7~1_combout\,
	datac => \LCD:contador2[3]~q\,
	datad => \Selector7~4_combout\,
	combout => \Selector7~5_combout\);

-- Location: LCCOMB_X65_Y67_N8
\Selector7~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~7_combout\ = ((\Selector7~5_combout\) # ((!\Selector16~0_combout\ & \Datos[1]~reg0_q\))) # (!\Selector7~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector7~6_combout\,
	datab => \Selector16~0_combout\,
	datac => \Datos[1]~reg0_q\,
	datad => \Selector7~5_combout\,
	combout => \Selector7~7_combout\);

-- Location: FF_X65_Y67_N9
\Datos[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector7~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Datos[1]~reg0_q\);

-- Location: LCCOMB_X65_Y68_N20
\Mux17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux17~0_combout\ = (\LCD:contador2[2]~q\ & (((\LCD:contador2[3]~q\)))) # (!\LCD:contador2[2]~q\ & ((\LCD:contador2[3]~q\ & ((\LCD:contador2[1]~q\))) # (!\LCD:contador2[3]~q\ & (\LCD:contador2[0]~q\ & !\LCD:contador2[1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[0]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \LCD:contador2[1]~q\,
	combout => \Mux17~0_combout\);

-- Location: LCCOMB_X65_Y68_N22
\Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\current_state.MESG1~q\ & \Mux17~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.MESG1~q\,
	datad => \Mux17~0_combout\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X65_Y68_N0
\Selector6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (!\LCD:contador2[2]~q\ & (!\LCD:contador2[1]~q\ & (\LCD:contador2[0]~q\ & !\LCD:contador2[3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \LCD:contador2[0]~q\,
	datad => \LCD:contador2[3]~q\,
	combout => \Selector6~1_combout\);

-- Location: LCCOMB_X65_Y67_N4
\Mux23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux23~0_combout\ = (\stack_mem~24_combout\ & ((\stack_mem~23_combout\) # ((\stack_mem~21_combout\) # (!\stack_mem~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem~23_combout\,
	datab => \stack_mem~24_combout\,
	datac => \stack_mem~21_combout\,
	datad => \stack_mem~20_combout\,
	combout => \Mux23~0_combout\);

-- Location: LCCOMB_X65_Y67_N2
\Mux29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux29~0_combout\ = (\stack_mem~19_combout\ & ((\stack_mem~18_combout\) # ((\stack_mem~17_combout\) # (!\stack_mem~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem~18_combout\,
	datab => \stack_mem~17_combout\,
	datac => \stack_mem~22_combout\,
	datad => \stack_mem~19_combout\,
	combout => \Mux29~0_combout\);

-- Location: LCCOMB_X65_Y67_N6
\Selector6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~2_combout\ = (\LCD:contador2[0]~q\ & ((\LCD:contador2[1]~q\) # ((\Mux29~0_combout\)))) # (!\LCD:contador2[0]~q\ & (\LCD:contador2[1]~q\ & (\Mux23~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[0]~q\,
	datab => \LCD:contador2[1]~q\,
	datac => \Mux23~0_combout\,
	datad => \Mux29~0_combout\,
	combout => \Selector6~2_combout\);

-- Location: LCCOMB_X65_Y67_N24
\Selector6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~3_combout\ = (\Selector6~1_combout\) # ((\LCD:contador2[3]~q\ & (\LCD:contador2[2]~q\ & \Selector6~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[3]~q\,
	datab => \LCD:contador2[2]~q\,
	datac => \Selector6~1_combout\,
	datad => \Selector6~2_combout\,
	combout => \Selector6~3_combout\);

-- Location: LCCOMB_X65_Y67_N10
\Selector6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~4_combout\ = (!\LessThan2~0_combout\ & ((\Selector6~0_combout\) # ((\current_state.MESG2~q\ & \Selector6~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~0_combout\,
	datab => \Selector6~0_combout\,
	datac => \current_state.MESG2~q\,
	datad => \Selector6~3_combout\,
	combout => \Selector6~4_combout\);

-- Location: LCCOMB_X65_Y67_N22
\Selector6~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~5_combout\ = ((\Selector6~4_combout\) # ((!\Selector16~0_combout\ & \Datos[2]~reg0_q\))) # (!\Selector7~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector7~6_combout\,
	datab => \Selector16~0_combout\,
	datac => \Datos[2]~reg0_q\,
	datad => \Selector6~4_combout\,
	combout => \Selector6~5_combout\);

-- Location: FF_X65_Y67_N23
\Datos[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector6~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Datos[2]~reg0_q\);

-- Location: LCCOMB_X65_Y69_N30
\Selector5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~6_combout\ = (\current_state.D_OFF~q\) # ((\current_state.D_ON~q\) # (!\current_state.LCD_INI~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.D_OFF~q\,
	datac => \current_state.LCD_INI~q\,
	datad => \current_state.D_ON~q\,
	combout => \Selector5~6_combout\);

-- Location: LCCOMB_X65_Y69_N6
\Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\stack_mem~16_q\ & (!\stack_mem_rtl_0|auto_generated|ram_block1a2\ & (!\stack_mem_rtl_0|auto_generated|ram_block1a1\ & \stack_mem_rtl_0|auto_generated|ram_block1a3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem~16_q\,
	datab => \stack_mem_rtl_0|auto_generated|ram_block1a2\,
	datac => \stack_mem_rtl_0|auto_generated|ram_block1a1\,
	datad => \stack_mem_rtl_0|auto_generated|ram_block1a3\,
	combout => \Selector5~0_combout\);

-- Location: LCCOMB_X65_Y69_N4
\Selector5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~1_combout\ = (\LCD:contador2[1]~q\ & ((\LCD:contador2[0]~q\) # ((\LCD:contador2[2]~q\ & \Selector5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[1]~q\,
	datab => \LCD:contador2[2]~q\,
	datac => \LCD:contador2[0]~q\,
	datad => \Selector5~0_combout\,
	combout => \Selector5~1_combout\);

-- Location: LCCOMB_X65_Y69_N26
\Selector5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~2_combout\ = (\LCD:contador2[0]~q\ & \LCD:contador2[2]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LCD:contador2[0]~q\,
	datad => \LCD:contador2[2]~q\,
	combout => \Selector5~2_combout\);

-- Location: LCCOMB_X65_Y69_N20
\Selector5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~3_combout\ = (!\stack_mem~19_combout\ & (!\stack_mem~17_combout\ & (\Selector5~2_combout\ & \stack_mem~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem~19_combout\,
	datab => \stack_mem~17_combout\,
	datac => \Selector5~2_combout\,
	datad => \stack_mem~22_combout\,
	combout => \Selector5~3_combout\);

-- Location: LCCOMB_X65_Y69_N10
\Selector5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~4_combout\ = (\Selector6~1_combout\) # ((\LCD:contador2[3]~q\ & ((\Selector5~1_combout\) # (\Selector5~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[3]~q\,
	datab => \Selector6~1_combout\,
	datac => \Selector5~1_combout\,
	datad => \Selector5~3_combout\,
	combout => \Selector5~4_combout\);

-- Location: LCCOMB_X65_Y69_N24
\Selector5~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~5_combout\ = (!\LessThan2~0_combout\ & ((\Selector6~0_combout\) # ((\current_state.MESG2~q\ & \Selector5~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~0_combout\,
	datab => \Selector6~0_combout\,
	datac => \current_state.MESG2~q\,
	datad => \Selector5~4_combout\,
	combout => \Selector5~5_combout\);

-- Location: LCCOMB_X65_Y69_N8
\Selector5~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~7_combout\ = (\Selector5~6_combout\) # ((\Selector5~5_combout\) # ((!\Selector16~0_combout\ & \Datos[3]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector5~6_combout\,
	datab => \Selector16~0_combout\,
	datac => \Datos[3]~reg0_q\,
	datad => \Selector5~5_combout\,
	combout => \Selector5~7_combout\);

-- Location: FF_X65_Y69_N9
\Datos[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector5~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Datos[3]~reg0_q\);

-- Location: LCCOMB_X66_Y68_N28
\Selector4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~2_combout\ = (\current_state.LCD_INI~q\ & (((\LessThan2~0_combout\) # (\Selector7~0_combout\)) # (!\current_state.MESG1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.MESG1~q\,
	datab => \current_state.LCD_INI~q\,
	datac => \LessThan2~0_combout\,
	datad => \Selector7~0_combout\,
	combout => \Selector4~2_combout\);

-- Location: LCCOMB_X67_Y68_N26
\Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\LCD:contador2[2]~q\ & (((!\LCD:contador2[3]~q\)))) # (!\LCD:contador2[2]~q\ & ((\LCD:contador2[0]~q\ $ (\LCD:contador2[3]~q\)) # (!\LCD:contador2[1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[1]~q\,
	datab => \LCD:contador2[0]~q\,
	datac => \LCD:contador2[2]~q\,
	datad => \LCD:contador2[3]~q\,
	combout => \Selector4~0_combout\);

-- Location: LCCOMB_X65_Y68_N6
\Mux27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux27~0_combout\ = (((!\stack_mem_rtl_0|auto_generated|ram_block1a6\ & !\stack_mem_rtl_0|auto_generated|ram_block1a5\)) # (!\stack_mem_rtl_0|auto_generated|ram_block1a7\)) # (!\stack_mem~16_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem~16_q\,
	datab => \stack_mem_rtl_0|auto_generated|ram_block1a6\,
	datac => \stack_mem_rtl_0|auto_generated|ram_block1a5\,
	datad => \stack_mem_rtl_0|auto_generated|ram_block1a7\,
	combout => \Mux27~0_combout\);

-- Location: LCCOMB_X65_Y68_N16
\Mux35~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux35~2_combout\ = (\LCD:contador2[0]~q\ & !\LCD:contador2[1]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LCD:contador2[0]~q\,
	datad => \LCD:contador2[1]~q\,
	combout => \Mux35~2_combout\);

-- Location: LCCOMB_X65_Y68_N14
\Mux35~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux35~0_combout\ = (!\LCD:contador2[0]~q\ & \LCD:contador2[1]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LCD:contador2[0]~q\,
	datad => \LCD:contador2[1]~q\,
	combout => \Mux35~0_combout\);

-- Location: LCCOMB_X66_Y68_N18
\Mux35~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux35~1_combout\ = (\Mux35~0_combout\ & (((!\stack_mem_rtl_0|auto_generated|ram_block1a1\ & !\stack_mem_rtl_0|auto_generated|ram_block1a2\)) # (!\stack_mem~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux35~0_combout\,
	datab => \stack_mem_rtl_0|auto_generated|ram_block1a1\,
	datac => \stack_mem_rtl_0|auto_generated|ram_block1a2\,
	datad => \stack_mem~20_combout\,
	combout => \Mux35~1_combout\);

-- Location: LCCOMB_X66_Y68_N12
\Mux35~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux35~3_combout\ = ((\Mux35~1_combout\) # ((\Mux27~0_combout\ & \Mux35~2_combout\))) # (!\LessThan2~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~1_combout\,
	datab => \Mux27~0_combout\,
	datac => \Mux35~2_combout\,
	datad => \Mux35~1_combout\,
	combout => \Mux35~3_combout\);

-- Location: LCCOMB_X66_Y68_N2
\Selector4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = (\Selector22~0_combout\ & ((\Selector4~0_combout\) # ((\LCD:contador2[2]~q\ & \Mux35~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \Selector4~0_combout\,
	datac => \Selector22~0_combout\,
	datad => \Mux35~3_combout\,
	combout => \Selector4~1_combout\);

-- Location: LCCOMB_X66_Y68_N24
\Selector4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~3_combout\ = ((\Selector4~1_combout\) # ((!\Selector16~0_combout\ & \Datos[4]~reg0_q\))) # (!\Selector4~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector16~0_combout\,
	datab => \Selector4~2_combout\,
	datac => \Datos[4]~reg0_q\,
	datad => \Selector4~1_combout\,
	combout => \Selector4~3_combout\);

-- Location: FF_X66_Y68_N25
\Datos[4]~reg0\ : dffeas
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
	q => \Datos[4]~reg0_q\);

-- Location: LCCOMB_X66_Y68_N10
\Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\Datos[5]~reg0_q\ & ((\WideOr2~combout\) # ((!\WideOr9~0_combout\ & \LessThan2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Datos[5]~reg0_q\,
	datab => \WideOr9~0_combout\,
	datac => \LessThan2~0_combout\,
	datad => \WideOr2~combout\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X66_Y68_N20
\Selector3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\LCD:contador2[2]~q\ & (((\Mux35~3_combout\) # (!\LCD:contador2[3]~q\)))) # (!\LCD:contador2[2]~q\ & ((\LCD:contador2[0]~q\) # ((\LCD:contador2[3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111001011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[0]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \Mux35~3_combout\,
	combout => \Selector3~1_combout\);

-- Location: LCCOMB_X66_Y68_N30
\Selector3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (\Selector3~0_combout\) # (((\Selector22~0_combout\ & \Selector3~1_combout\)) # (!\Selector4~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector3~0_combout\,
	datab => \Selector4~2_combout\,
	datac => \Selector22~0_combout\,
	datad => \Selector3~1_combout\,
	combout => \Selector3~2_combout\);

-- Location: FF_X66_Y68_N31
\Datos[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Datos[5]~reg0_q\);

-- Location: LCCOMB_X65_Y68_N12
\Mux15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (\LCD:contador2[2]~q\ & (((!\LCD:contador2[3]~q\)))) # (!\LCD:contador2[2]~q\ & ((\LCD:contador2[3]~q\ & ((!\LCD:contador2[1]~q\))) # (!\LCD:contador2[3]~q\ & ((\LCD:contador2[0]~q\) # (\LCD:contador2[1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LCD:contador2[0]~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \LCD:contador2[1]~q\,
	combout => \Mux15~0_combout\);

-- Location: LCCOMB_X65_Y68_N10
\Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (\current_state.MESG1~q\ & !\Mux15~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.MESG1~q\,
	datad => \Mux15~0_combout\,
	combout => \Selector2~1_combout\);

-- Location: LCCOMB_X65_Y68_N26
\Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\current_state.L2~q\) # ((\Datos[6]~reg0_q\ & !\Selector16~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Datos[6]~reg0_q\,
	datac => \current_state.L2~q\,
	datad => \Selector16~0_combout\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X65_Y68_N4
\Selector2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~2_combout\ = (\Mux35~2_combout\ & (\stack_mem~22_combout\ & ((\stack_mem_rtl_0|auto_generated|ram_block1a5\) # (\stack_mem_rtl_0|auto_generated|ram_block1a6\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem_rtl_0|auto_generated|ram_block1a5\,
	datab => \Mux35~2_combout\,
	datac => \stack_mem~22_combout\,
	datad => \stack_mem_rtl_0|auto_generated|ram_block1a6\,
	combout => \Selector2~2_combout\);

-- Location: LCCOMB_X65_Y68_N18
\Selector2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~3_combout\ = (\Mux35~0_combout\ & (\stack_mem~20_combout\ & ((\stack_mem_rtl_0|auto_generated|ram_block1a1\) # (\stack_mem_rtl_0|auto_generated|ram_block1a2\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stack_mem_rtl_0|auto_generated|ram_block1a1\,
	datab => \Mux35~0_combout\,
	datac => \stack_mem_rtl_0|auto_generated|ram_block1a2\,
	datad => \stack_mem~20_combout\,
	combout => \Selector2~3_combout\);

-- Location: LCCOMB_X65_Y68_N28
\Selector2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~4_combout\ = ((\LCD:contador2[2]~q\ & ((\Selector2~2_combout\) # (\Selector2~3_combout\)))) # (!\LessThan2~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[2]~q\,
	datab => \LessThan2~1_combout\,
	datac => \Selector2~2_combout\,
	datad => \Selector2~3_combout\,
	combout => \Selector2~4_combout\);

-- Location: LCCOMB_X65_Y68_N2
\Selector2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~5_combout\ = (\current_state.MESG2~q\ & ((\Selector7~0_combout\) # ((\LCD:contador2[3]~q\ & \Selector2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector7~0_combout\,
	datab => \current_state.MESG2~q\,
	datac => \LCD:contador2[3]~q\,
	datad => \Selector2~4_combout\,
	combout => \Selector2~5_combout\);

-- Location: LCCOMB_X65_Y68_N24
\Selector2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~6_combout\ = (\Selector2~0_combout\) # ((!\LessThan2~0_combout\ & ((\Selector2~1_combout\) # (\Selector2~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector2~1_combout\,
	datab => \LessThan2~0_combout\,
	datac => \Selector2~0_combout\,
	datad => \Selector2~5_combout\,
	combout => \Selector2~6_combout\);

-- Location: FF_X65_Y68_N25
\Datos[6]~reg0\ : dffeas
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
	q => \Datos[6]~reg0_q\);

-- Location: LCCOMB_X65_Y69_N14
\Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\LCD:contador2[3]~q\ & ((\LCD:contador2[2]~q\ & ((!\LCD:contador2[1]~q\) # (!\LCD:contador2[0]~q\))) # (!\LCD:contador2[2]~q\ & ((\LCD:contador2[1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LCD:contador2[3]~q\,
	datab => \LCD:contador2[2]~q\,
	datac => \LCD:contador2[0]~q\,
	datad => \LCD:contador2[1]~q\,
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X65_Y69_N12
\Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (\current_state.L1~q\) # ((\current_state.L2~q\) # ((\Selector1~0_combout\ & \current_state.MESG1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L1~q\,
	datab => \Selector1~0_combout\,
	datac => \current_state.MESG1~q\,
	datad => \current_state.L2~q\,
	combout => \Selector1~1_combout\);

-- Location: LCCOMB_X65_Y69_N22
\Selector1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (\Selector1~1_combout\) # ((!\Selector16~0_combout\ & \Datos[7]~reg0_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector16~0_combout\,
	datac => \Datos[7]~reg0_q\,
	datad => \Selector1~1_combout\,
	combout => \Selector1~2_combout\);

-- Location: FF_X65_Y69_N23
\Datos[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_dly~clkctrl_outclk\,
	d => \Selector1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Datos[7]~reg0_q\);

-- Location: LCCOMB_X65_Y69_N18
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

-- Location: LCCOMB_X65_Y69_N16
\E~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \E~1_combout\ = (!\current_state.L2~q\ & (\E~0_combout\ & ((\WideOr9~0_combout\) # (\LessThan2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.L2~q\,
	datab => \WideOr9~0_combout\,
	datac => \LessThan2~0_combout\,
	datad => \E~0_combout\,
	combout => \E~1_combout\);

-- Location: LCCOMB_X65_Y69_N2
\E~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \E~2_combout\ = (!\LCD:contador[2]~q\ & (((!\LCD:contador[1]~q\ & !\E~1_combout\)) # (!\current_state.LCD_INI~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.LCD_INI~q\,
	datab => \LCD:contador[1]~q\,
	datac => \LCD:contador[2]~q\,
	datad => \E~1_combout\,
	combout => \E~2_combout\);

-- Location: FF_X65_Y69_N19
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

-- Location: LCCOMB_X65_Y69_N0
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

-- Location: FF_X65_Y69_N1
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

-- Location: LCCOMB_X67_Y69_N30
\Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\current_state.ASK3~q\ & (((\confirm~input_o\)))) # (!\current_state.ASK3~q\ & (\current_state.LCD_INI~q\ & (!\current_state.L2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.LCD_INI~q\,
	datab => \current_state.ASK3~q\,
	datac => \current_state.L2~q\,
	datad => \confirm~input_o\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X67_Y69_N8
\Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (\current_state.ASK2~q\) # ((\current_state.ASK1~q\) # ((\Selector0~0_combout\ & \RS~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector0~0_combout\,
	datab => \current_state.ASK2~q\,
	datac => \RS~reg0_q\,
	datad => \current_state.ASK1~q\,
	combout => \Selector0~1_combout\);

-- Location: FF_X67_Y69_N9
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

ww_Datos(0) <= \Datos[0]~output_o\;

ww_Datos(1) <= \Datos[1]~output_o\;

ww_Datos(2) <= \Datos[2]~output_o\;

ww_Datos(3) <= \Datos[3]~output_o\;

ww_Datos(4) <= \Datos[4]~output_o\;

ww_Datos(5) <= \Datos[5]~output_o\;

ww_Datos(6) <= \Datos[6]~output_o\;

ww_Datos(7) <= \Datos[7]~output_o\;

ww_E <= \E~output_o\;

ww_RS <= \RS~output_o\;

ww_RW <= \RW~output_o\;

ww_Stack_Empty <= \Stack_Empty~output_o\;

ww_Stack_Full <= \Stack_Full~output_o\;
END structure;


