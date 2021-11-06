library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	
entity m_ram is
	port(cs,r_w : in std_logic;
		I:in std_logic_vector(7 downto 0);
		A:in std_logic_vector(2 downto 0);
		D: out std_logic_vector(7 downto 0));
		
	end m_ram;
	
	architecture mem of m_ram is
	type ram is array (7 downto 0) of std_logic_vector(7 downto 0);
	signal dato:ram;
	signal clk_r,clk_w:std_logic;
	begin
		clk_w<=not(r_w) and not(cs);
		clk_r<=r_w and not(cs);
		
	escritura:process(clk_w)
		begin
		
		if(clk_w'event and clk_w='1')then
			dato(conv_integer(A))<=I;
		end if;	
		end process;
		
	lectura: process(clk_r)
		begin
		if(cs='1')then D<="ZZZZZZZZ";
			elsif(clk_r'event and clk_r='1')then
			 D<=dato(conv_integer(A));
		end if;	
		end process;
	end mem;
		
		