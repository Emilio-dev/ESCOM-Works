library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	
entity mi_rom is
	port(cs : in std_logic;
		A:in std_logic_vector(2 downto 0);
		D: out std_logic_vector(7 downto 0));
		
	end mi_rom;
	
	architecture mem of mi_rom is
	begin
		process(cs,A)
		begin
		if(cs='0')then
		case A is 
		when "000"=> D <="11111111";
		when "001"=> D <="00111000";
		when "010"=> D <="01111100";
		when "011"=> D <="11111110";
		when "100"=> D <="00111000";
		when "101"=> D <="00111000";
		when "110"=> D <="00111000";
		when others=> D <="00111000";
	end case;
		else D<="ZZZZZZZZ";
		end if;
		end process;
	end mem;
		
		