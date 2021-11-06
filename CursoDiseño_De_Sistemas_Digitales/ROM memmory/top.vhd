library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Final is
     Port (ent,clk,clr:in std_logic;
           leds : out  STD_LOGIC_VECTOR (7 downto 0);
		   activos : out  STD_LOGIC_VECTOR (7 downto 0));
end Final;

architecture Behavioral of Final is

component Cont is
    Port ( Clk,Clr : in   STD_LOGIC;
           Q : inout  STD_LOGIC_VECTOR (2 downto 0));
end component;


component tres is
	port(
		A:in std_logic_vector(2 downto 0);
		O: out std_logic_vector(7 downto 0));	
end component;

component mi_rom is
	port(cs : in std_logic;
		A:in std_logic_vector(2 downto 0);
		D: out std_logic_vector(7 downto 0));		
end component;

signal qaux:std_logic_vector(2 downto 0);

 begin
 
cto1: Cont port map(clk,clr,qaux);
cto2: tres port map (qaux,activos);
cto3: mi_rom port map(ent,qaux,leds);

end Behavioral;
