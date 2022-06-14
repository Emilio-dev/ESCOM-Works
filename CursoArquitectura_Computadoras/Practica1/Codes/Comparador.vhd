library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity comparador is
	port(cina : in std_logic_vector(7 downto 0);
		cinb : in std_logic_vector(7 downto 0);
		cout :out std_logic);
end entity;

architecture arq_comp of comparador is
begin
	process(cina,cinb)
		begin
			if (cina = cinb) then
				cout<='1';
			else
				cout<='0';
			end if;	
	end process;
end architecture;