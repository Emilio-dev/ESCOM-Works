library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Final is
     Port (cs,clk,clk2,clr:in std_logic;
			cuarto:in STD_LOGIC_VECTOR (2 downto 0);
            contrasena: inout  STD_LOGIC_VECTOR (7 downto 0);
		    ingresa : in  STD_LOGIC_VECTOR (2 downto 0);
			lcd_g:out std_logic_vector(9 downto 0));
end Final;

architecture Behavioral of Final is

component clk_div is
    Port ( clk,clr : in   STD_LOGIC;
           q : inout  STD_LOGIC_VECTOR (5 downto 0));
end component;


component mi_rom is
	port(cs : in std_logic;
		A:in std_logic_vector(2 downto 0);
		D: out std_logic_vector(7 downto 0));		
end component;

component detector_de_secuencia is 
	port(clk, clr: in std_logic;
		sw: in std_logic_vector(7 downto 0);
		ent: in std_logic_vector(1 downto 0);
		paso, no_paso: out std_logic);
end component;

component lcd_a is
		port (ent : in std_logic_vector(5 downto 0);
		ent2: in std_logic_vector(1 downto 0);
		ent3,ent4: in std_logic;
		salida:out std_logic_vector(9 downto 0));
end component;

component E_rebotes is 
		port(clk, clr: in std_logic;
		ent: in std_logic_vector(2 downto 0);
		sal: out std_logic);
end component;


signal qaux:std_logic_vector(5 downto 0);
signal paso,no_paso,salida_rebotes:std_logic;
signal que_va:std_logic_vector (1 downto 0);

 begin
 
cto1: clk_div port map(clk,clr,qaux);
cto2: mi_rom port map(cs,cuarto,contrasena);
cto3:detector_de_secuencia port map(salida_rebotes,clr,contrasena,ingresa(1 downto 0),paso,no_paso);
cto4: lcd_a port map(qaux,ingresa(1 downto 0),no_paso,paso,lcd_g);
cto5: E_rebotes port map(clk,clr,ingresa,salida_rebotes);
que_va<=ingresa(1 downto 0);


end Behavioral;
