
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Final is
    Port (clr,clk:in std_logic;
           leds : out  STD_LOGIC_VECTOR (6 downto 0);
		   activos : out  STD_LOGIC_VECTOR (3 downto 0));
end Final;

architecture Behavioral of Final is


component Cont is 
		port(clk,clr:in std_logic;
		Q:inout std_logic_vector(11 downto 0));
end component;

component Conv_Bin_BCD is
    Port ( Bin : in   STD_LOGIC_VECTOR (9 downto 0);
           cen : out  STD_LOGIC_VECTOR (3 downto 0);
           dec : out  STD_LOGIC_VECTOR (3 downto 0);
           uni : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Mux_31 is
    Port ( Centenas : in  STD_LOGIC_VECTOR (3 downto 0);
           Decenas : in  STD_LOGIC_VECTOR (3 downto 0);
           Unidades : in  STD_LOGIC_VECTOR (3 downto 0);
           Selectores : in  STD_LOGIC_VECTOR (1 downto 0);
           Salidas : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Dec7seg is
port(  BCD: in  STD_LOGIC_VECTOR (3 downto 0);
       led: out STD_LOGIC_VECTOR(6 downto 0) ); 
 end component;
 
component dec2 is
    Port ( Input : in  STD_LOGIC_VECTOR(1 downto 0);
           Catodos : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

Signal XCen, XDec, XUni, XBCD: STD_LOGIC_VECTOR (3 downto 0);
signal q28_aux:std_logic_vector(11 downto 0);
signal qx:std_logic_vector(9 downto 0);
signal qz:std_logic_vector(1 downto 0);

 begin
 
cto1: Cont port map(clk,clr,q28_aux);
qx<=q28_aux(11 downto 2);
qz<=q28_aux(1 downto 0);
cto2: Conv_Bin_BCD port map (qx,XCen, XDec, XUni);
cto3: Mux_31 port map(XCen, XDec, XUni,qz, XBCD );
cto4: Dec7seg port map (XBCD, leds);
cto5: dec2 port map(qz,activos);

end Behavioral;
