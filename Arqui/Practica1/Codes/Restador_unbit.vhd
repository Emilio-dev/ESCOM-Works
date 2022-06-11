library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity restador_unbit is
        port 
		(
            rest, carryOut : out std_logic;
            a, b, carryIn : in std_logic
        );
end restador_unbit;

architecture restador1_arq of restador_unbit is
begin
    rest <= a XOR b XOR carryIn;
	carryOut <= (carryIn and (not (a xor b)));
end restador1_arq;
