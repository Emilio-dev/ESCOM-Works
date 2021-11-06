library ieee;
use ieee.std_logic_1164.all;
entity reg is
port (ABCD:in std_logic_vector(3 downto 0);
	  s:in std_logic_vector(1 downto 0);
	  clk,clr,Ent_Iz,Ent_der:in std_logic;
	  QAQBQCQD:out std_logic_vector(3 downto 0));
end reg;

architecture registro of reg is 
signal qaux : std_logic_vector(3 downto 0);
begin

		process(clk,clr)
		 begin
			if(clr='1')then qaux<="0000";
			elsif(clk'event and clk='1')then
			
				case s is
				when "00"=>qaux<=ABCD;
				when "01"=>qaux(2 downto 0)<=qaux(3 downto 1);
							qaux(3)<=Ent_Iz;
				when "10"=>qaux(3 downto 1)<=qaux(2 downto 0);
							qaux(0)<=Ent_der;
				when others => qaux<=qaux;
				end case;	
				
			end if;
		end process;
			
		QAQBQCQD<=qaux;
		end registro;