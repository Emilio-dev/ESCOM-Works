
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Mux_31 is
    Port ( Centenas : in  STD_LOGIC_VECTOR (3 downto 0);
           Decenas : in  STD_LOGIC_VECTOR (3 downto 0);
           Unidades : in  STD_LOGIC_VECTOR (3 downto 0);
           Selectores : in  STD_LOGIC_VECTOR (1 downto 0);
           Salidas : out  STD_LOGIC_VECTOR (3 downto 0));
end Mux_31;

architecture Behavioral of Mux_31 is

begin
process (Selectores,Unidades,Decenas,Centenas)
begin
   case Selectores is
      when "00" => Salidas <= Unidades;
      when "01" => Salidas <= Decenas;
      when "10" => Salidas <= Centenas;
      when others => Salidas <= "0000";
   end case;
end process;

end Behavioral;
