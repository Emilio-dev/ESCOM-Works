library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Final is
     Port (ent,clk,clk2,clr,r_w:in std_logic;
           leds : out  STD_LOGIC_VECTOR (7 downto 0);
		   activos : out  STD_LOGIC_VECTOR (7 downto 0);
		   entradas : in  STD_LOGIC_VECTOR (7 downto 0));
end Final;

architecture Behavioral of Final is

component Cont is
    Port ( Clk,clr : in   STD_LOGIC;
           Q : inout  STD_LOGIC_VECTOR (3 downto 0));
end component;


component tres is
	port(
		A:in std_logic_vector(2 downto 0);
		O: out std_logic_vector(7 downto 0));	
end component;

component m_ram is
	port(cs,r_w : in std_logic;
		I:in std_logic_vector(7 downto 0);
		A:in std_logic_vector(2 downto 0);
		D: out std_logic_vector(7 downto 0));	
end component;

component mux is
    Port (s,reloj,clean: in   STD_LOGIC;
           salmux : out  STD_LOGIC);
end component;

component rebote is
	port(cs,clk190,clr : in std_logic;
		 clean:out std_logic);
end component;

signal qaux:std_logic_vector(3 downto 0);
signal auxclean:std_logic;
signal qx:std_logic_vector(2 downto 0);
signal qz,muxr:std_logic;
 begin
 
cto1: Cont port map(muxr,clr,qaux);
qx<=qaux(2 downto 0);
cto2: tres port map (qx,activos);
cto3: m_ram port map(ent,r_w,entradas,qx,leds);
cto4: mux port map(r_w,clk,clean,muxr);
cto5: rebote port map(ent,clk2,clr,auxclean);


end Behavioral;
