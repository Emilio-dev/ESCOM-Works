library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity or_gate is
    port(cina : in std_logic_vector(7 downto 0);
		 cinb : in std_logic_vector(7 downto 0);
         cout : out std_logic_vector(7 downto 0)); 
end or_gate;

architecture orLogic of or_gate is
begin
    cout <= (cina) OR (cinb);
end orLogic;
