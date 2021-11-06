library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity buf is
    Port ( Clk : in   STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
		   D : in  STD_LOGIC_VECTOR (3 downto 0));
end buf;

architecture Behavioral of buf is

begin
process (Clk) 
begin

   if Clk ='0' and Clk'event then
	Q<=D;
  end if;
end process;

end Behavioral;