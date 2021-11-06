library IEEE;
use IEEE.std_logic_1164.all;

entity mux4 is
    port (   salida : out std_logic;
			s : in std_logic_vector(1 downto 0);
			i : in std_logic_vector(3 downto 0));
end mux4;

architecture behavioral of mux4 is
begin
process(s)
begin
case s is
			when "00" => salida <= i(0);
            when "01" => salida <= i(1);
            when "10" => salida <= i(2);
            when others => salida <= i(3);
end case;
end process;
end behavioral;