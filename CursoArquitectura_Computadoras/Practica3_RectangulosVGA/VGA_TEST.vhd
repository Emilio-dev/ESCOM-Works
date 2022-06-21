----	Programa de control de sincronia		----
----	Modificado por:	U581
----	Diseñado Originalmente por:	Anton
----	Fecha:	18 de Enero de 2021

	--	Declaracion de las bibliotecas --

			library ieee;
			use ieee.std_logic_1164.all;
			use ieee.std_logic_unsigned.all;
			use ieee.numeric_std.all;

	--	Declaracion de la entidad
				
			Entity VGA_TEST Is
					port(
						CLOCK_24: in std_logic_vector(1 downto 0);
						CLOCK_50 : in std_logic;
						VGA_HS,VGA_VS,VGA_CLK: out std_logic;
						VGA_R, VGA_G, VGA_B: out std_logic_vector(3 downto 0);
						KEY: in std_logic_vector(3 downto 0);
						SW : in std_logic_vector(2 downto 0)
						);
			END VGA_TEST;
			
	--	Declaracion de la arquitectura --

			Architecture MAIN of VGA_TEST is
				Signal VGACLK,RESET:STD_LOGIC;
	--	Declaracion del componente de sincronia			
	
			 COMPONENT SYNC IS
					 port(
						CLK: in std_logic;
						HSYNC,VSYNC: out std_logic;
						R,G,B: out std_logic_vector(3 downto 0);
						--se agregan los keys--
						KEYS: in std_logic_vector(3 downto 0);
						--creo que esto son los switch
						S : in std_logic_vector(2 downto 0)
					);
			  END COMPONENT SYNC;

			--	Declaracion del lazo de fase cerrado

				 component pll is
					  port (
							 clkin_clk   : in  std_logic := 'X'; -- clk
							 reset_reset : in  std_logic := 'X'; -- reset
							 clkout1_clk : out std_logic;        -- clk
							 clkout2_clk : out std_logic         -- clk
             			 );
				 END COMPONENT pll;
 
				BEGIN
				
				--VGA_BLANK_N <= '1';			-- La limpieza de pantalla no se hace directamente
				--VGA_SYNC_N	<= '1';			--	No se usa la sincronia por color verde
				
				C: pll PORT MAP (CLOCK_50,RESET,VGA_CLK,VGACLK);
				C1: SYNC PORT MAP(VGACLK,VGA_HS,VGA_VS,VGA_R,VGA_G,VGA_B,KEY,SW);
				
 
			END MAIN;
 