library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Final is
     Port (clk,clr,senal2:in std_logic;
			salmux4: inout std_logic;
           leds : inout  STD_LOGIC_VECTOR (3 downto 0);
		   entradas: in  STD_LOGIC_VECTOR (3 downto 0);
		   salidasdec: inout  STD_LOGIC_VECTOR (3 downto 0));
end Final;

architecture Behavioral of Final is

component buf is
    Port ( Clk : in   STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
		   D : in  STD_LOGIC_VECTOR (3 downto 0));
end component;


component Cont is
		Port ( Clk,clr : in   STD_LOGIC;
           mod16 : inout  STD_LOGIC_VECTOR (3 downto 0));
end component;

component dec2 is
	Port ( Input : in  STD_LOGIC_VECTOR(1 downto 0);
           Teclado : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component mux4 is
	
	 Port(salida : out std_logic;
        s: in std_logic_vector(1 downto 0);
		i:in std_logic_vector(3 downto 0));
end component;

signal qaux:std_logic_vector(3 downto 0);
signal dec2in:std_logic_vector(1 downto 0);
signal mux4in:std_logic_vector(1 downto 0);
signal contclk:std_logic;

 begin

cto1: buf port map(salmux4,leds,qaux);
contclk<=salmux4 and senal2;
cto2: cont port map (contclk,clr,qaux);
dec2in<=qaux(1 downto 0);
cto3: dec2 port map(dec2in,salidasdec);
mux4in<=qaux(3 downto 2);
cto4: mux4 port map(salmux4,mux4in,entradas);
end Behavioral;