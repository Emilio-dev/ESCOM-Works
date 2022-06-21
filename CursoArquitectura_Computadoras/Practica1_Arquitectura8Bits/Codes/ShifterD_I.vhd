library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity shifter is
	port(A: in std_logic;
		selector : in std_logic_vector(2 downto 0);
		I : in std_logic_vector(7 downto 0);
		o :out std_logic_vector(7 downto 0));
end entity;

architecture arq_shif of shifter is
	begin
		process(A,I,selector)
			begin
				if (A='1') then
					case selector is
					when "000"=>o<=I;			
					when "001"=>o(6 downto 0)<=I (7 downto 1);
								o(7)<='0';					
					when "010"=>o(5 downto 0)<=I (7 downto 2);
								o(7 downto 6)<="00";						
					when "011"=>o(4 downto 0)<=I (7 downto 3);
								o(7 downto 5)<="000";							
					when "100"=>o(3 downto 0)<=I (7 downto 4);
								o(7 downto 4)<="0000";							
					when "101"=>o(2 downto 0)<=I (7 downto 5);
								o(7 downto 3)<="00000";							
					when "110"=>o(1 downto 0)<=I (7 downto 6);
								o(7 downto 2)<="000000";	
					when others =>o(0)<=I(7);
								o(7 downto 1)<="0000000";
					end case;	
					else
						case selector is
					when "000"=>o<=I;
					when "001"=>o(7 downto 1)<=I (6 downto 0);
								o(0)<='0';			
					when "010"=>o(7 downto 2)<=I (5 downto 0);
								o(1 downto 0)<="00";							
					when "011"=>o(7 downto 3)<=I (4 downto 0);
								o(2 downto 0)<="000";					
					when "100"=>o(7 downto 4)<=I (3 downto 0);
								o(3 downto 0)<="0000";				
					when "101"=>o(7 downto 5)<=I (2 downto 0);
								o(4 downto 0)<="00000";					
					when "110"=>o(7 downto 6)<=I (1 downto 0);
								o(5 downto 0)<="000000";		
					when others =>o(7)<=I(0);
								o(6 downto 0)<="0000000";				
					end case;
				end if;	
		end process;
end architecture;
