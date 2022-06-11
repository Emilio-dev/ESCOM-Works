library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity xor_gate is
    port(cina : in std_logic_vector(7 downto 0);
		 cinb : in std_logic_vector(7 downto 0);
         cout : out std_logic_vector(7 downto 0)); 
end xor_gate;

architecture xorLogic of xor_gate is
begin
    cout <= (cina) XOR (cinb);
end xorLogic;
