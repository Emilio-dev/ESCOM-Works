library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity clk_div is 
		port(clk,clr:in std_logic;
			q18:out std_logic_vector(5 downto 0));
end clk_div;

architecture divisor of clk_div is
signal qaux:std_logic_vector(29 downto 0);
begin
	process(clk,clr)
		begin
			if(clr='1') then qaux <=(others =>'0');
			elsif(clk'event and clk='1') then
				qaux<=qaux+1;
			end if;
		end process;
		q18 <= qaux(5 downto 0);
end divisor;