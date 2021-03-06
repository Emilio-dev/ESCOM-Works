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
					PORT(
						CLOCK_50: IN STD_LOGIC;
						VGA_HS,VGA_VS,VGA_SYNC_N,VGA_BLANK_N,VGA_CLK:OUT STD_LOGIC;
						VGA_R,VGA_B,VGA_G: OUT STD_LOGIC_VECTOR(7 downto 0)
					    );
			END VGA_TEST;
			
	--	Declaracion de la arquitectura --

			Architecture MAIN of VGA_TEST is
				Signal VGACLK,RESET:STD_LOGIC;
	--	Declaracion del componente de sincronia			
	
			 COMPONENT SYNC2 IS
					 PORT(
						CLK: IN STD_LOGIC;
						HSYNC: OUT STD_LOGIC;
						VSYNC: OUT STD_LOGIC;
						R, G, B: OUT STD_LOGIC_VECTOR(7 downto 0)
							);
			  END COMPONENT SYNC2;

			--	Declaracion del lazo de fase cerrado

				 component pll is
					  port (
							 clk_in_clk   : in  std_logic := 'X'; -- clk
							 reset_reset  : in  std_logic := 'X'; -- reset
							 clk_out1_clk : out std_logic;        -- clk
							 clk_out2_clk : out std_logic         -- clk
             			 );
				 END COMPONENT pll;
 
				BEGIN
				
				VGA_BLANK_N <= '1';			-- No se usa la limpieza de pantalla directamente
				VGA_SYNC_N	<= '1';			--	No se usa la sincronia del verde
				
				C: pll PORT MAP (CLOCK_50,RESET,VGA_CLK,VGACLK);
				C1: SYNC2 PORT MAP(VGACLK,VGA_HS,VGA_VS,VGA_R,VGA_G,VGA_B);
 
			END MAIN;
 