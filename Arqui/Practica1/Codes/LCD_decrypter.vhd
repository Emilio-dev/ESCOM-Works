
    -- Programa de funciones y procedimientos para controlar el LCD
	 -- Elaborado por: U581
	 -- Fecha: 7 de diciembre de 2021
	 
	 -- ------------------------------------
	 --      Declaracion de bibliotecas
	 -- ------------------------------------
	 
Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_signed.all;        
Use ieee.numeric_std.all;
				 
entity LCD_decrypter is
	port(u:in integer range 0 to 15;
		op:in std_logic_vector(4 downto 0);
		 data: in std_logic_vector(7 downto 0);
		 datares,dataop: out std_logic_vector(7 downto 0));
end entity;

architecture ctrl_LCD of LCD_decrypter is

	type arreglo is array (0 to 15) of std_logic_vector(7 downto 0); 
	type arreglo2 is array (0 to 7) of std_logic_vector(7 downto 0);
	signal i: integer range 0 to 7;
	
	signal convertions : arreglo2;
	
	signal result : arreglo :=( X"FE", X"FE", X"FE",  --and
				                                 convertions(0), convertions(1),convertions(2), convertions(3), convertions(4), convertions(5), convertions(6),convertions(7), X"FE", X"FE",
														   X"FE", X"FE", X"FE" );			
	constant op1 : arreglo := ( X"FE", X"41", X"6E",  --and
				                                 X"64", X"FE", X"FE", X"30", X"30", X"30", X"30", X"30", X"FE", X"FE",
														   X"FE", X"FE", X"FE" );
	constant op2 : arreglo := ( X"FE", X"4E", X"6F",  --not
				                                 X"74", X"FE", X"FE", X"30", X"30", X"30", X"30", X"31", X"FE", X"FE",
														   X"FE", X"FE", X"FE" );
	constant op3 : arreglo := ( X"FE", X"4F", X"72",  --or
												 X"FE", X"FE", X"FE", X"30", X"30", X"30", X"31", X"30", X"FE", X"FE",
																	   X"FE", X"FE", X"FE" );
	constant op4 : arreglo := ( X"FE", X"58", X"6f",  --xor
												 X"72", X"FE", X"FE", X"30", X"30", X"30", X"31", X"31", X"FE", X"FE",
																	   X"FE", X"FE", X"FE" );
	constant op5 : arreglo := ( X"FE", X"58", X"6E",  --xnor
												 X"6F", X"72", X"FE", X"30", X"30", X"31", X"30", X"30", X"FE", X"FE",
																	   X"FE", X"FE", X"FE" );
	constant op6 : arreglo := ( X"FE", X"53", X"75",  --suma
												X"6D", X"61", X"FE", X"30", X"30", X"31", X"30", X"31", X"FE", X"FE",
																	  X"FE", X"FE", X"FE" );
	constant op7 : arreglo := ( X"FE", X"52", X"65",  --resta
												X"73", X"74", X"61", X"FE", X"30", X"30", X"31", X"31", X"30", X"FE",
																	  X"FE", X"FE", X"FE" );
	constant op8 : arreglo := ( X"FE", X"41", X"3E",  --mayormenor
												X"42", X"3F", X"FE", X"30", X"30", X"31", X"31", X"31", X"FE", X"FE",
																	  X"FE", X"FE", X"FE" );
	constant op9 : arreglo := ( X"FE", X"41", X"3D",  --igualdad
												X"42", X"3F", X"FE", X"30", X"31", X"30", X"30", X"30", X"FE", X"FE",
																	  X"FE", X"FE", X"FE" );
	constant op10 : arreglo := ( X"FE", X"43", X"6F",  --corrimiento
												X"72", X"72", X"FE", X"30", X"31", X"30", X"30", X"31", X"FE", X"FE",
																	  X"FE", X"FE", X"FE" );
	constant op11 : arreglo := ( X"FE", X"52", X"61",  --Ram
												X"6D", X"FE", X"FE", X"30", X"31", X"30", X"31", X"30", X"FE", X"FE",
																	  X"FE", X"FE", X"FE" );	
	constant opnu : arreglo := ( X"FE", X"FE", X"FE",  --Ram
												X"FE", X"FE", X"FE", X"FE", X"FE", X"FE", X"FE", X"FE", X"FE", X"FE",
																	  X"FE", X"FE", X"FE" );	

	begin
	process(op,u,i)			
		begin	
			for i in 0 to 7 loop
					if (data(i) = '0') then
						convertions(i) <= X"30";
					else
						convertions(i)<=X"31";
					end if;
			end loop;
			case op is
				when "00000"=>dataop <= op1(u);	--and		
				when "00001"=>dataop <= op2(u);	--not
				when "00010"=>dataop <= op3(u);	--or
				when "00011"=>dataop <= op4(u);	--xor
				when "00100"=>dataop <= op5(u);	--xnor
				when "00101"=>dataop <= op6(u);	--suma
				when "00110"=>dataop <= op7(u);	--resta
				when "00111"=>dataop <= op8(u);	--mayor
				when "01000"=>dataop <= op9(u);	--comparador
				when "01001"=>dataop <= op10(u);	--corrimiento
				when "01010"=>dataop <= op11(u);	--ram
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
				when others =>dataop <= opnu(u);
			end case;		
				datares<=result(u);
	end process;	
end ctrl_LCD;
			 
		
	  