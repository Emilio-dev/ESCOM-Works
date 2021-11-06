library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mux is
    Port (s,reloj,clean: in STD_LOGIC;
           salmux : out  STD_LOGIC);
end mux;

architecture m of mux is
begin
process(s,reloj,clean)
begin
if(s='0') then salmux<=clean;
else salmux<=reloj;
end if;
end process;
end m;