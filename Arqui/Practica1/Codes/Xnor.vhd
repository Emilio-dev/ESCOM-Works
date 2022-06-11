library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity xnor_gate is
    port(cina : in std_logic_vector(7 downto 0);
		 cinb : in std_logic_vector(7 downto 0);
         cout : out std_logic_vector(7 downto 0)); 
end xnor_gate;

architecture xorLogic of xnor_gate is
begin
    cout <= NOT((cina) XOR (cinb));
end xorLogic;
