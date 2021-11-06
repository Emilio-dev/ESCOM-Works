
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dec2 is
    Port ( Input : in  STD_LOGIC_VECTOR(1 downto 0);
           Teclado : out  STD_LOGIC_VECTOR (3 downto 0));
end dec2;

architecture Behavioral of dec2 is

begin
process(Input)
begin
         case Input is
            when "00" => Teclado <= "0111";
            when "01" => Teclado <= "1011";
            when "10" => Teclado <= "1101";
            when others => Teclado <= "1110";
         end case;
  Teclado(0) <= '1'; 
 end process;  
   
end Behavioral;
