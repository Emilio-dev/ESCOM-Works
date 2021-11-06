
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dec2 is
    Port ( Input : in  STD_LOGIC_VECTOR(1 downto 0);
           Catodos : out  STD_LOGIC_VECTOR (3 downto 0));
end dec2;

architecture Behavioral of dec2 is

begin
process(Input)
begin
         case Input is
            when "00" => Catodos <= "1110";
            when "01" => Catodos <= "1101";
            when "10" => Catodos <= "1011";
            when others => Catodos <= "1111";
         end case;
  Catodos(0) <= '1'; 
 end process;  
   
end Behavioral;
