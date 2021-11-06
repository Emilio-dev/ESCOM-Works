library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity detector_de_secuencia is 
	port(clk, clr: in std_logic;
		sw: in std_logic_vector(7 downto 0);
		ent: in std_logic_vector(1 downto 0);
		paso, no_paso: out std_logic);
end detector_de_secuencia;

architecture detector of detector_de_secuencia is
type estados is (S0,S1,S2,S3,S4,E0,E1,E2,E3);
signal edo_pres, edo_sig:estados;
begin
	process(ent,edo_pres)
		begin
			case edo_pres is
				when S0 =>
					paso <= '0';
					no_paso <= '0';
					if (ent = sw(7 downto 6)) then
						edo_sig <=S1;
					else
						edo_sig <= E0;
					end if;
				when S1 =>
					paso <= '0';
					no_paso <= '0';
					if (ent = sw(5 downto 4)) then
						edo_sig <=S2;
					else
						edo_sig <= E1;
					end if;
				when S2 =>
					paso <= '0';
					no_paso <= '0';
					if (ent = sw(3 downto 2)) then
						edo_sig <=S3;
					else
						edo_sig <= E2;
					end if;
				when S3 =>
					paso <= '0';
					no_paso <= '0';
					if (ent = sw(1 downto 0)) then
						edo_sig <=S4;
					else
						edo_sig <= E3;
					end if;
				when S4 =>
					paso <= '1';
					no_paso <= '0';
					if (ent = "10") then
						edo_sig <=S1;
					else
						edo_sig <= E0;
					end if;
					
				when E0 =>
					paso <= '0';
					no_paso <= '0';
					edo_sig <=E1;
				when E1 =>
					paso <= '0';
					no_paso <= '0';
					edo_sig <=E2;
				when E2 =>
					paso <= '0';
					no_paso <= '0';
					edo_sig <=E3;
				when E3 =>
					paso <= '0';
					no_paso <= '1';
					if (ent = sw(7 downto 6)) then
						edo_sig <=S1;
					else
						edo_sig <= E0;
					end if;
			end case;
		end process;
		process (clk,clr)
		begin
			if(clr='1')then 
				edo_pres<=S0;
			elsif(clk'event and clk = '1')then 
				edo_pres<=edo_sig;
			end if;
		end process;
end detector;