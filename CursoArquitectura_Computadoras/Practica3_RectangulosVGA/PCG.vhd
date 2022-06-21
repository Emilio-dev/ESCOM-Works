-- Programa de procedimientos para mover cuadros
--	Modificado por: U581
--	Diseñado por: Anton
--	Fecha:	19 de Enero de 2021

	--	Declaracion de bibliotecas	--
			library ieee;
			use ieee.std_logic_1164.all;
			use ieee.numeric_std.all;
			
			package ctrl is
				procedure SQ(signal Xcur,Ycur,Xpos,Ypos: in integer; signal RGB: out std_logic_vector(3 downto 0); signal DRAW: out std_logic);
			end ctrl;
			
			package body ctrl is
				procedure SQ(signal Xcur,Ycur,Xpos,Ypos: in integer; signal RGB: out std_logic_vector(3 downto 0); signal DRAW: out std_logic) is
	
			begin
				if(Xcur > Xpos and Xcur < (Xpos+1) and Ycur > Ypos AND Ycur < (Ypos +1))then
					RGB <= "1111";
					DRAW <= '1';
				else
					DRAW <= '0';
				end if;
				end SQ;
			end ctrl;
			
			