library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	
entity tres is
	port(
		A:in std_logic_vector(2 downto 0);
		O: out std_logic_vector(7 downto 0));
	end tres;
	
	architecture siete of tres is
	begin
		process(A)
		begin
		case A is 
		when "000"=> O <="11111110";
		when "001"=> O <="11111101";
		when "010"=> O <="11111011";
		when "011"=> O <="11110111";
		when "100"=> O <="11101111";
		when "101"=> O <="11011111";
		when "110"=> O <="10111111";
		when others=> O <="01111111";
	end case;
		end process;
	end siete;
		
		