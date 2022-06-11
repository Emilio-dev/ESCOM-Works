library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity m_ram is
	port(r_w,clk,clr: in std_logic;
		selector:in std_logic_vector(2 downto 0);
		I:in std_logic_vector(7 downto 0);
		D: out std_logic_vector(7 downto 0));		
end entity;
	
architecture arq_mem of m_ram is
	type ram is array (6 downto 0) of std_logic_vector(7 downto 0);
	signal dato:ram;
	constant base_dly    : Integer := 1000; 		    -- Constante para 50Hz
	signal countdly    : INTEGER range 0 to base_dly;  -- Señal para retardo
	signal clkdly   : std_logic;                       -- Reloj ya ralentizado
	begin

	escritura:process(selector,clkdly)
		begin
		if(clkdly'event and r_w='1')then
				case selector is
					when "000"=>dato(0)<=I;			
					when "001"=>dato(1)<=I;
					when "010"=>dato(2)<=I;	
					when "011"=>dato(3)<=I;			
					when "100"=>dato(4)<=I;
					when "101"=>dato(5)<=I;
					when "110"=>dato(6)<=I;			
					when others =>D<= "ZZZZZZZZ";
				end case;	
		end if;
	end process;
		
	lectura: process(clkdly,selector)
		begin	
		if(clkdly'event and r_w='0')then
				case selector is
					when "000"=>D<=dato(0);			
					when "001"=>D<=dato(1);
					when "010"=>D<=dato(2);	
					when "011"=>D<=dato(3);			
					when "100"=>D<=dato(4);
					when "101"=>D<=dato(5);
					when "110"=>D<=dato(6);			
					when others =>D<= "ZZZZZZZZ";
				end case;		
		end if;	
	end process;
	
	Clock:process(countdly, clk, clkdly, clr)   
			  begin
						 if clr = '0' then                  -- Si hay un reset
							 clkdly<='0';       -- Que inicie con el estado inicializacion     
						 elsif (clk' event and clk = '1') then  -- Control del reloj (50MHz))
							  if countdly < base_dly then        -- Control de incremento del contador
								countdly <= countdly+1;    -- Incremento del contador para retardo
							else
										 clkdly <= not clkdly;        -- Generacion de pulsos para el reloj ralentizado
										 countdly <= 0;               -- Reinicio del contador para retardo
							end if;	
			 
						 end if;

	end process;
			  	
end architecture;
		
		
		