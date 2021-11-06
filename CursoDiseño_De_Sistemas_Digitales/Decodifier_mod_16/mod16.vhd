library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Cont is
    Port ( Clk,clr : in   STD_LOGIC;
           mod16 : inout  STD_LOGIC_VECTOR (3 downto 0));
end Cont;

architecture Behavioral of Cont is

begin
process (Clk,clr) 
begin
If clr='1' then mod16<="0000";
else
   if Clk ='1' and Clk'event then
	if mod16 = "1111" then mod16 <= "0000";
    else
	mod16 <= mod16 + 1;
   end if;
  end if;
  end if;
end process;

end Behavioral;