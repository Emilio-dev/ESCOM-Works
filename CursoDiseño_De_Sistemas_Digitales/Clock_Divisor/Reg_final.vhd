library ieee;
use ieee.std_logic_1164.all;
entity reg_fin is
	port(clr,ent_iz,ent_der:in std_logic;
		 s:in std_logic_vector(1 downto 0);
		 abcd :in std_logic_vector(3 downto 0);
		 qabcd:out std_logic_vector(3 downto 0));
	 end reg_fin;
	 
	 architecture reg_top of reg_fin is
     
	component reg is
		  port (ABCD:in std_logic_vector(3 downto 0);
		  s:in std_logic_vector(1 downto 0);
		  clk,clr,Ent_Iz,Ent_der:in std_logic;
		  QAQBQCQD:out std_logic_vector(3 downto 0));
	end component;

    component clk_div is 
	   port(clk,clr:in std_logic;
			q2:out std_logic);
	end component;
		
	component osc00 is
	  port(
		 osc_int0: inout std_logic);
	end component;

	signal q2_aux,osc_aux:std_logic;
		begin
	
cto1: clk_div port map(clk=>osc_aux,clr=>clr,q2=>q2_aux);cto2: reg port map(ABCD=>abcd,s=>s,clk=>q2_aux,clr=>clr,Ent_Iz=>ent_iz,Ent_der=>ent_der,QAQBQCQD=>qabcd);
cto3: osc00 port map(osc_int0=>osc_aux);

	end reg_top;