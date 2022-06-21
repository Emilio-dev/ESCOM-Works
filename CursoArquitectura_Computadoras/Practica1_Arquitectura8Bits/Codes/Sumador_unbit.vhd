library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity sumador_unbit is
        port 
		(sum, carryOut : out std_logic;
            a, b, carryIn : in std_logic);
end sumador_unbit;

architecture sumador1_arq of sumador_unbit is
begin
    sum <= a XOR b XOR carryIn;
	carryOut <= (a AND b) OR (a AND carryIn) or (b and carryIn);
end sumador1_arq;
