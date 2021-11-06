
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Dec7seg is
port(  BCD: in  STD_LOGIC_VECTOR (3 downto 0);
       led: out STD_LOGIC_VECTOR(6 downto 0) ); 
 end Dec7seg;
 
architecture comportamiento of Dec7seg is
begin
 process (BCD)
begin
case BCD is
  when "0000" => LED <=  "0000001"; --0
  when "0001" => LED <=  "1001111"; --1
  when "0010" => LED <=  "0010010"; --2
  when "0011" => LED <=  "0000110"; --3
  when "0100" => LED <=  "1001100"; --4 
  when "0101" => LED <=  "0100100"; --5
  when "0110" => LED <=  "0100000"; --6
  when "0111" => LED <=  "0001111"; --7
  when "1000" => LED <=  "0000000"; --8
  when "1001" => LED <=  "0001100"; --9
  when others => LED <=  "0001100"; --9
end case;
end process ;
end comportamiento;
