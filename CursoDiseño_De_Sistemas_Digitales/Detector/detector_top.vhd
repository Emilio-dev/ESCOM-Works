library ieee;
use ieee.std_logic_1164.all;
entity contador is
	port(clr : in std_logic;
		sw: in std_logic_vector(7 downto 0);
		btn: in std_logic_vector(2 downto 0);
		paso, no_paso: out std_logic
	);
end contador;

architecture contador_7_seg of contador is
	component clk_div is 
		port(clk, clr: in std_logic;
			q13: out std_logic);
	end component;
	
	component  E_rebotes is 
		port(clk, clr: in std_logic;
		ent: in std_logic_vector(2 downto 0);
		sal: out std_logic);
	end component;
	
	component  detector_de_secuencia is 
	port(clk, clr: in std_logic;
		sw: in std_logic_vector(7 downto 0);
		ent: in std_logic_vector(1 downto 0);
		paso, no_paso: out std_logic);
	end component;
	
	
	component osc00 is
		port(
			osc_int0: inout std_logic
		);
	end component;

	signal osc_aux: std_logic;
	signal q13_aux: std_logic;
	signal salida_rebotes_aux: std_logic;

		begin
	cto1: clk_div port map (clk=>osc_aux, clr=>clr, q13=>q13_aux);
	cto2: detector_de_secuencia port map (clk=>salida_rebotes_aux, clr=>clr, sw=>sw, ent=>btn(1 downto 0), paso=>paso, no_paso=>no_paso);
	cto4: E_rebotes port map (clk=>q13_aux, clr=>clr, ent => btn, sal => salida_rebotes_aux);
	cto6: osc00 port map(osc_int0=>osc_aux);
	
end contador_7_seg;	