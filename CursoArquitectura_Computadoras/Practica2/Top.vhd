library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity top is
    port(cin : in std_logic_vector(7 downto 0);
		 ins,clk,reset,enable:in std_logic;
         COUT : out std_logic_vector(7 downto 0);
		 carryOut: out std_logic
		 E, RS, RW: out std_logic);
end entity;

architecture arqtop of top is
		
	component sumador is
		port (aVect : in std_logic_vector (7 downto 0);
			bVect : in std_logic_vector (7 downto 0);
			sVect : out std_logic_vector (7 downto 0)
			carryOut: out std_logic);
	end component;
	
	component LCD_main is
		Port( clr, clk, sw: in std_logic;
			resultado :in std_logic_vector(7 downto 0);
			Datos: out std_logic_vector(7 downto 0);
			E, RS, RW: out std_logic);		 
	end component;

	signal INA,INB,resultado: std_logic_vector(7 downto 0);
	
		begin
		op5: sumador port map (INA, INB,resultado,carryOUT);
		LCD: LCD_main port map(clk,reset,enable,resultado,COUT,E,RS,RW);
		
		process(selector,ins)
			begin
					if(ins='0') then
						INA<=cin;
					else
						INB<=cin;
					end if;	
					case selector is
						when "00000"=>resultado(20) <= resultado(0);	--and		
						when "00001"=>resultado(20) <= resultado(1);	--not
						when "00010"=>resultado(20) <= resultado(2);	--or
						when "00011"=>resultado(20) <= resultado(3);	--xor
						when "00100"=>resultado(20) <= resultado(4);	--xnor
						when "00101"=>resultado(20) <= resultado(5);	--suma
						when "00110"=>resultado(20) <= resultado(6);	--resta
						when "00111"=>resultado(20) <= resultado(7);	--mayor
						when "01000"=>resultado(20) <= resultado(8);	--comparador
						when "01001"=>resultado(20) <= resultado(9);	--corrimiento
						when "01010"=>resultado(20) <= resultado(10);	--Ram
						--when "01011"=>resultado(20) <= resultado(11);
						--when "01100"=>resultado(20) <= resultado(12);
						--when "01101"=>resultado(20) <= resultado(13);
						--when "01110"=>resultado(20) <= resultado(14);
						--when "01111"=>resultado(20) <= resultado(15);
						--when "10000"=>resultado(20) <= resultado(16);
						--when "10001"=>resultado(20) <= resultado(17);
						--when "10010"=>resultado(20) <= resultado(18);
						--when "10011"=>resultado(20) <= resultado(19);
						--when "10100"=>resultado(20) <= resultado(20);
						when others =>resultado(20) <= "ZZZZZZZZ";
					end case;	
		end process;
end architecture;
