library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity gauss is
port(
	ab : in std_logic_vector(3 downto 0); 
	equationSel:in std_logic_vector(1 downto 0);
	variableSel: in std_logic_vector(2 downto 0);
	cantidadVar: in std_logic_vector(2 downto 0);
	reset,clk,ready: in std_logic;
	salida : out std_logic_vector(7 downto 0));
end gauss;

architecture behavior of gauss is
	type matType is array (0 to 3, 0 to 4) of integer range 0 to 255;
	signal matrix : matType:=(others =>(others=>0));
	type arreglo is array (0 to 3) of std_logic_vector(7 downto 0);
	signal x:arreglo;
	signal ratio,var,i,j,k,finish :integer range 0 to 255 := 0;	
	
begin

fill: process(equationSel,variableSel,ready,ab,clk)
begin
if rising_edge(clk) and ready='0' then
	case equationSel is
	when "00" => case variableSel is 
						when "000"=>matrix(0,0)<=TO_INTEGER(unsigned(ab));
						when "001"=>matrix(0,1)<=TO_INTEGER(unsigned(ab));
						when "010"=>matrix(0,2)<=TO_INTEGER(unsigned(ab));
						when "011"=>matrix(0,3)<=TO_INTEGER(unsigned(ab));
						when "100"=>matrix(0,4)<=TO_INTEGER(unsigned(ab));
						when others=>NULL;
						end case;
	when "01"=>	case variableSel is 
						when "000"=>matrix(1,0)<=TO_INTEGER(unsigned(ab));
						when "001"=>matrix(1,1)<=TO_INTEGER(unsigned(ab));
						when "010"=>matrix(1,2)<=TO_INTEGER(unsigned(ab));
						when "011"=>matrix(1,3)<=TO_INTEGER(unsigned(ab));
						when "100"=>matrix(1,4)<=TO_INTEGER(unsigned(ab));
						when others=>NULL;
						end case;
	when "10"=> case variableSel is 
						when "000"=>matrix(2,0)<=TO_INTEGER(unsigned(ab));
						when "001"=>matrix(2,1)<=TO_INTEGER(unsigned(ab));
						when "010"=>matrix(2,2)<=TO_INTEGER(unsigned(ab));
						when "011"=>matrix(2,3)<=TO_INTEGER(unsigned(ab));
						when "100"=>matrix(2,4)<=TO_INTEGER(unsigned(ab));
						when others=>NULL;
						end case;
	when "11"=> case variableSel is 
						when "000"=>matrix(3,0)<=TO_INTEGER(unsigned(ab));
						when "001"=>matrix(3,1)<=TO_INTEGER(unsigned(ab));
						when "010"=>matrix(3,2)<=TO_INTEGER(unsigned(ab));
						when "011"=>matrix(3,3)<=TO_INTEGER(unsigned(ab));
						when "100"=>matrix(3,4)<=TO_INTEGER(unsigned(ab));
						when others=>NULL;
						end case;
	when others=>NULL;
	end case;
end if;	
end process;

gauss: process(ready,k,j,i,clk,finish)
		if rising_edge(clk) and ready='1' then
			var<=TO_INTEGER(unsigned(cantidadVar));
			if k <= var then
				if i < var then
					ratio <= matrix(i,k);
					if j < var then
						if  i/= j then
							matrix(i, j) <= (matrix(k,k)*matrix(i, j)) - (ratio*matrix(k,j));
						end if;	
						j<= j + 1;	
					end if;	
					i<= i + 1;	
				end if;
				k<= k + 1;
			end if;
			if k=var then
				finish<=1;
			end if;
		end if;	
if rising_edge(clk) and finsih=1 then		
		for i in 0 to var loop
			x(i) <= std_logic_vector(to_signed(matrix(i,var)/matrix(i,i), x(i)'length));
		end loop;
end if;
end process;
newton: process(ready,k,j,i,clk,finish)
end process;
end architecture;
