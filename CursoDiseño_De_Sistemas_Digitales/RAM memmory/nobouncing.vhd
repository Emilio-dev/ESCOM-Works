library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity rebote is
	port(cs,clk190,clr : in std_logic;
		 clean:out std_logic);
		 end rebote;
		 
		architecture re of rebote is
		signal	d1,d2,d3:std_logic;
		begin
		process(clr,clk190)
		begin
		If clr='1' then 
		d3<='0';
		d2<='0';
		d1<='0';
			Else
				If clk190 ='1' and clk190'event then 
				d2<=d1;
				d3<=d2;
				d1<=cs;
				end if;	
		end if;		
		clean<=d1 and d2 and d3;
	end process;
end re;	