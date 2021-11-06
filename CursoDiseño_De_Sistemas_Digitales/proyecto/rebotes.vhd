library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity  E_rebotes is 
		port(clk, clr: in std_logic;
		ent: in std_logic_vector(2 downto 0);
		sal: out std_logic);
end E_rebotes;

architecture rebotes of E_rebotes is
signal or_compuerta: std_logic;
begin
	process(clk,clr)
		begin
			if(clr='1') then or_compuerta<='0';
			elsif(clk'event and clk='1') then
				or_compuerta <=  ent(0) or ent(1) or ent(2);
				if(or_compuerta = '1') then
					sal<='1';
				else
					sal<='0';
				end if;
			end if;
		end process;
end rebotes;