library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Conv_Bin_BCD is
    Port ( Bin : in   STD_LOGIC_VECTOR (9 downto 0);
           cen : out  STD_LOGIC_VECTOR (3 downto 0);
           dec : out  STD_LOGIC_VECTOR (3 downto 0);
           uni : out  STD_LOGIC_VECTOR (3 downto 0));
end Conv_Bin_BCD;

architecture Behavioral of Conv_Bin_BCD is

begin

Process(Bin)
variable z: STD_LOGIC_VECTOR (27 downto 0);
begin
for i in 0 to 27 loop
z(i) := '0';
end loop;
z(12 downto 3) := Bin;

for i in 0 to 8 loop
if z(15 downto 12) > 4 then
z(15 downto 12) := z(15 downto 12) + 3;
end if;
if z(19 downto 16) > 4 then
z(19 downto 16) := z(19 downto 16) + 3;
end if;

if z(23 downto 20) > 4 then
z(23 downto 20) := z(23 downto 20) + 3;
end if;

if z(27 downto 24) > 4 then
z(27 downto 24) := z(27 downto 24) + 3;
end if;
z(27 downto 1) := z(26 downto 0);
end loop;

uni <= z(15 downto 12);
dec  <= z(19 downto 16);
cen <= z(23 downto 20);
end process ;
end Behavioral;