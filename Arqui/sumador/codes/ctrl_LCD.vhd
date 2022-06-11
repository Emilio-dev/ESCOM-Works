
    -- Programa de funciones y procedimientos para controlar el LCD
	 --Elaborado por: 	Aparicio Méndez Karla Ximena
	--						Caxantheje Ortiz Jazmin Lizeth 
	--					  	Cruz Hernández Jhovany
	--					  	Díaz Montoya Sebastián
	--					  	Lopéz Ramirez Byron Yael
	--						Lorenzo Pioquinto Alejandro 
	--					  	Martínez Suarez Sergio Omar
	--						Rubio Haro Rodrigo Rodolfo 
	--					  	Sánchez Zavala Carlos Enrique
	--Fecha de última modificación: 10 de marzo del 2022
	 
	 -- ------------------------------------
	 --      Declaracion de bibliotecas
	 -- ------------------------------------
	 
	      Library ieee;
			Use ieee.std_logic_1164.all;
			Use ieee.std_logic_signed.all;          -- Esta biblioteca es usada para operaciones con signo
			Use ieee.numeric_std.all;
			
	 -- ************************************
	 --        Declaracion de paquetes
	 -- ************************************
	 
	      package ctrl_LCD is
			
			   -- Declaracion de arreglos para mensaje
				
				type arreglo is array (0 to 15) of std_logic_vector(7 downto 0);   -- Creacion de un arreglo
				type byte is array (0 to 7) of std_logic_vector(7 downto 0);
				
				--Declaración de algunas letras que se repiten mucho
				constant Rmayus : std_logic_vector(7 downto 0) := X"52";
				constant h : std_logic_vector(7 downto 0) := X"68";
				constant cero : std_logic_vector(7 downto 0) := X"30";
				constant uno : std_logic_vector(7 downto 0) := X"31";
				constant dos : std_logic_vector(7 downto 0) := X"32";
				constant tres : std_logic_vector(7 downto 0) := X"33";
				constant cuatro : std_logic_vector(7 downto 0) := X"34";
				constant cinco : std_logic_vector(7 downto 0) := X"35";
				constant seis : std_logic_vector(7 downto 0) := X"36";
				constant siete : std_logic_vector(7 downto 0) := X"37";
				constant ocho : std_logic_vector(7 downto 0) := X"38";
				constant nueve : std_logic_vector(7 downto 0) := X"39";
				constant Amayus : std_logic_vector(7 downto 0) := X"41";
				constant B : std_logic_vector(7 downto 0) := X"42";
				constant C : std_logic_vector(7 downto 0) := X"43";
				constant D : std_logic_vector(7 downto 0) := X"44";
				constant Emayus : std_logic_vector(7 downto 0) := X"45";
				constant F : std_logic_vector(7 downto 0) := X"46";
				constant eminus : std_logic_vector(7 downto 0) := X"65";
				constant g : std_logic_vector(7 downto 0) := X"67";
				constant Tmayus : std_logic_vector(7 downto 0) := X"54";
				constant Tminus : std_logic_vector(7 downto 0) := "01110100";
				constant espacio : std_logic_vector(7 downto 0) := X"FE";
				constant o : std_logic_vector(7 downto 0) := X"6F";
				constant Mmayus : std_logic_vector(7 downto 0) := "01001101";
				constant Mminus : std_logic_vector(7 downto 0) := "01101101";
				constant v : std_logic_vector(7 downto 0) := "01110110";
				constant Cmayus : std_logic_vector(7 downto 0) := "01000011";
				constant l : std_logic_vector(7 downto 0) := "01101100";
				constant rminus : std_logic_vector(7 downto 0) := "01110010";
				constant mas : std_logic_vector(7 downto 0) := "00101011";
				constant menos : std_logic_vector(7 downto 0) := "00101101";
				constant X : std_logic_vector(7 downto 0) := "01011000";
				constant s : std_logic_vector(7 downto 0) := "01110011";
				constant n : std_logic_vector(7 downto 0) := "01101110";
				constant cminus : std_logic_vector(7 downto 0) := "01100011";
				constant aminus : std_logic_vector(7 downto 0) := "01100001";
				constant I : std_logic_vector(7 downto 0) := "01001001";
				constant igual : std_logic_vector(7 downto 0) := "00111101";
				constant excla : std_logic_vector(7 downto 0) := "00100001";
				constant mayorq : std_logic_vector(7 downto 0) := "00111100";
				constant menorq : std_logic_vector(7 downto 0) := "00111110";
				constant u : std_logic_vector(7 downto 0) := "01110101";
				constant Q : std_logic_vector(7 downto 0) := "01010001";
				constant comsimple : std_logic_vector(7 downto 0) := "01100000";
			
			   -- Declaración de procedimientos
			   procedure MensajeL1(variable cont : integer range 0 to 15; variable numMensaje : std_logic; signal dato : std_logic_vector(7 downto 0) ; signal salida: out std_logic_vector(7 downto 0) );
				procedure MensajeL2(variable cont : integer range 0 to 15; signal resultado: std_logic_vector(7 downto 0); signal salida: out std_logic_vector(7 downto 0) );
				
				type pila is array (3 downto 0) of std_logic_vector(7 downto 0);   -- Creacion de un tipo PILA
				

			   end ctrl_LCD;
			
	      -- ****************************************
	      --    Declaracion del cuerpo de paquete
	      -- ****************************************
	 
	      package body ctrl_LCD is
						   				
				procedure MensajeL1(variable cont : integer range 0 to 15; variable numMensaje : std_logic; signal dato : std_logic_vector(7 downto 0); signal salida: out std_logic_vector(7 downto 0) ) is	
					variable sal : arreglo;
					variable numero : byte;
				begin
					if dato(0) = '0' then
						numero(0):= cero;
					else
						numero(0):= uno;
					end if;
					if dato(1) = '0' then
						numero(1):= cero;
					else
						numero(1):= uno;
					end if;
					if dato(2) = '0' then
						numero(2):= cero;
					else
						numero(2):= uno;
					end if;
					if dato(3) = '0' then
						numero(3):= cero;
					else
						numero(3):= uno;
					end if;
					if dato(4) = '0' then
						numero(4):= cero;
					else
						numero(4):= uno;
					end if;
					if dato(5) = '0' then
						numero(5):= cero;
					else
						numero(5):= uno;
					end if;
					if dato(6) = '0' then
						numero(6):= cero;
					else
						numero(6):= uno;
					end if;
					if dato(7) = '0' then
						numero(7):= cero;
					else
						numero(7):= uno;
					end if;
					if numMensaje='0' then
						sal := (Amayus,igual,numero(7),numero(6),numero(5),numero(4),numero(3),numero(2),numero(1),numero(0),espacio,espacio,
						espacio,espacio,espacio,espacio);
					else
						sal := (B,igual,numero(7),numero(6),numero(5),numero(4),numero(3),numero(2),numero(1),numero(0),espacio,espacio,
						espacio,espacio,espacio,espacio);
					end if;
					salida<= sal(cont);
				end mensajeL1;
				
				procedure MensajeL2(variable cont : integer range 0 to 15; signal resultado: std_logic_vector(8 downto 0); signal salida: out std_logic_vector(7 downto 0) ) is	
					variable sal : arreglo;
					variable numero : byte;
					variable Cout : std_logic_vector(7 downto 0);
					variable aux1, aux2 : integer range 0 to 15; --la usaremos para asignar el valor que debemos usar en la conversión de binario al LCD
					variable dis1, dis2 : std_logic_vector(7 downto 0);
				begin
					aux1 := 0;
					aux2 := 0;
					--los if son para hacer la conversión binaria a hexadecimal y poder mostrarlo en el lcd
					if resultado(0) = '1' then
						aux1 := aux1+1;
					end if;
					if resultado(1) = '1' then
						aux1 := aux1+2;
					end if;
					if resultado(2) = '1' then
						aux1 := aux1+4;
					end if;
					if resultado(3) = '1' then
						aux1 := aux1+8;
					end if;
					if resultado(4) = '1' then
						aux2 := aux2+1;
					end if;
					if resultado(5) = '1' then
						aux2 := aux2+2;
					end if;
					if resultado(6) = '1' then
						aux2 := aux2+4;
					end if;
					if resultado(7) = '1' then
						aux2 := aux2+8;
					end if;
					--asignamos la constante que le corresponde según el valor de la conversión
					case aux1 is
					when 0 =>
						Dis1 := cero;
					when 1 =>
						Dis1 := uno;
					when 2 =>
						Dis1 := dos;
					when 3 =>
						Dis1 := tres;
					when 4 =>
						Dis1 := cuatro;
					when 5 =>
						Dis1 := cinco;
					when 6 =>
						Dis1 := seis;
					when 7 =>
						Dis1 := siete;
					when 8 =>
						Dis1 := ocho;
					when 9 =>
						Dis1 := nueve;
					when 10 =>
						Dis1 := Amayus;
					when 11 =>
						Dis1 := B;
					when 12 =>
						Dis1 := Cmayus;
					when 13 =>
						Dis1 := D;
					when 14 =>
						Dis1 := Emayus;
					when others =>
						Dis1 := F;
					end case;
					case aux2 is
					when 0 =>
						Dis2 := cero;
					when 1 =>
						Dis2 := uno;
					when 2 =>
						Dis2 := dos;
					when 3 =>
						Dis2 := tres;
					when 4 =>
						Dis2 := cuatro;
					when 5 =>
						Dis2 := cinco;
					when 6 =>
						Dis2 := seis;
					when 7 =>
						Dis2 := siete;
					when 8 =>
						Dis2 := ocho;
					when 9 =>
						Dis2 := nueve;
					when 10 =>
						Dis2 := Amayus;
					when 11 =>
						Dis2 := B;
					when 12 =>
						Dis2 := Cmayus;
					when 13 =>
						Dis2 := D;
					when 14 =>
						Dis2 := Emayus;
					when others =>
						Dis2 := F;
					end case;
					if resultado(0) = '0' then
						numero(0):= cero;
					else
						numero(0):= uno;
					end if;
					if resultado(1) = '0' then
						numero(1):= cero;
					else
						numero(1):= uno;
					end if;
					if resultado(2) = '0' then
						numero(2):= cero;
					else
						numero(2):= uno;
					end if;
					if resultado(3) = '0' then
						numero(3):= cero;
					else
						numero(3):= uno;
					end if;
					if resultado(4) = '0' then
						numero(4):= cero;
					else
						numero(4):= uno;
					end if;
					if resultado(5) = '0' then
						numero(5):= cero;
					else
						numero(5):= uno;
					end if;
					if resultado(6) = '0' then
						numero(6):= cero;
					else
						numero(6):= uno;
					end if;
					if resultado(7) = '0' then
						numero(7):= cero;
					else
						numero(7):= uno;
					end if;
					if resultado(8) = '0' then
						Cout:= cero;
					else
						Cout:= uno;
					end if;
					sal := (Rmayus,igual,Cout,numero(7),numero(6),numero(5),numero(4),numero(3),numero(2),numero(1),
						numero(0),h,Cout,dis2,dis1,espacio);
					salida<= sal(cont);	
				end mensajeL2;
			
			end ctrl_LCD;
			 
		
	  