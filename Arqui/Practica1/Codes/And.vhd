library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity and_gate is
    port(cina : in std_logic_vector(7 downto 0);
		 cinb : in std_logic_vector(7 downto 0);
         cout : out std_logic_vector(7 downto 0)); 
end and_gate;

architecture andLogic of and_gate is
begin
    cout <= (cina) AND (cinb);
end andLogic;
