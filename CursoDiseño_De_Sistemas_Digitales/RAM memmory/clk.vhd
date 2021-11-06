library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Cont is
    Port ( Clk,clr : in   STD_LOGIC;
           Q : inout  STD_LOGIC_VECTOR (3 downto 0));
end Cont;

architecture Behavioral of Cont is

begin
process (Clk,clr) 
begin
If clr='1' then Q<="0000";
else
   if Clk ='1' and Clk'event then
	if Q = "1111" then Q <= "0000";
    else
	Q <= Q + 1;
   end if;
  end if;
  end if;
end process;

end Behavioral;