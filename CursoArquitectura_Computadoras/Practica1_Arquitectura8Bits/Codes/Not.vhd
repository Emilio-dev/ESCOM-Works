library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity not_gate is
    port(cina : in std_logic_vector(7 downto 0);          
         cout : out std_logic_vector(7 downto 0)); 
end not_gate;

architecture notLogic of not_gate is
begin
    cout <= not(cina);
end notLogic;
