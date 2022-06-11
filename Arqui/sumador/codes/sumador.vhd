library ieee;
use ieee.std_logic_1164.all;
use work.ctrl_LCD.all;

entity sumador is 
port(
	a,b 						: in std_logic_vector(7 downto 0); 	--Entrada de los 2 sumandos
	D1, D2, D3, D4, D5	: out std_logic_vector(6 downto 0);	--Salida para los displays
	datos 					: out std_logic_vector(7 downto 0);	--Salida para LCD
	clr, clk					: in std_logic; 							--Boton de reset y señal de 
	confirm					: in std_logic; 							--Boton para confirmar la instrucción
	E, RS, RW				: out std_logic 							-- Botones que habilitan las funciones del LCD, pulso de reloj
																					--, modo escritura y modo escritura lectura
);
end entity;

architecture Asumador of sumador is
	signal acarreo : std_logic_vector(8 downto 0);
	signal resultado :std_logic_vector(8 downto 0);
	
	constant zero 	: std_logic_vector(6 downto 0) := "1000000";     -- Constante para mostrar 0
	constant uno  	: std_logic_vector(6 downto 0) := "1111001";		-- Constante para mostrar 1
	constant dos  	: std_logic_vector(6 downto 0) := "0100100";		-- Constante para mostrar 2
	constant tres 	: std_logic_vector(6 downto 0) := "0110000";		-- Constante para mostrar 3
	constant quat 	: std_logic_vector(6 downto 0) := "0011001";		-- Constante para mostrar 4
	constant qint 	: std_logic_vector(6 downto 0) := "0010010";		-- Constante para mostrar 5
	constant sixt 	: std_logic_vector(6 downto 0) := "0000010";		-- Constante para mostrar 6
	constant sept 	: std_logic_vector(6 downto 0) := "1111000";		-- Constante para mostrar 7
	constant octo 	: std_logic_vector(6 downto 0) := "0000000";		-- Constante para mostrar 8
	constant nono 	: std_logic_vector(6 downto 0) := "0010000";		-- Constante para mostrar 9
   constant OFF  	: std_logic_vector(6 downto 0) := "1111111";     -- Display apagado
	constant letA	: std_logic_vector(6 downto 0) := "0001000";		-- Constante para mostrar A
	constant letB	: std_logic_vector(6 downto 0) := "1111100";		-- Constante para mostrar b
	constant letC	: std_logic_vector(6 downto 0) := "1011000";		-- Constante para mostrar c
	constant letD	: std_logic_vector(6 downto 0) := "1011100";		-- Constante para mostrar d
	constant letE	: std_logic_vector(6 downto 0) := "1111001";		-- Constante para mostrar E
	constant letF	: std_logic_vector(6 downto 0) := "1110001";		-- Constante para mostrar F
	constant mas	: std_logic_vector(6 downto 0) := "0111001";		-- signo igual
	
	--Declaración de las constantes y señales para el proceso de ratardo
	constant base_dly	: integer := 10000;				--Base para hacer un retardo
	signal count_dly	: integer range 0 to base_dly;	--Señlal para guardar el retardo
	signal clk_dly		: std_logic;							--Reloj ya ralentizado
	
	--Declaración de estados para el manejo de LCD
	type state is (LCD_INI, D_OFF, LCD_CLR, D_ON, ENTRY, ASK1, MESG1, MESG2, ASK2, ASK3, L1, L2);    
			 -- Tipo para creacion de estados    
	signal current_state, next_state: state;    -- señales tipo estado
	
begin
	
	with a(3 downto 0) select
		D1 <= zero when "0000",
				uno  when "0001",
				dos  when "0010",
				tres when "0011",
				quat when "0100",
				qint when "0101",
				sixt when "0110",
				sept when "0111",
				octo when "1000",
				nono when "1001",
				letA when "1010",
				letB when "1011",
				letC when "1100",
				letD when "1101",
				letE when "1110",
				letF when "1111";
				
	with a(7 downto 4) select
		D2 <= zero when "0000",
				uno  when "0001",
				dos  when "0010",
				tres when "0011",
				quat when "0100",
				qint when "0101",
				sixt when "0110",
				sept when "0111",
				octo when "1000",
				nono when "1001",
				letA when "1010",
				letB when "1011",
				letC when "1100",
				letD when "1101",
				letE when "1110",
				letF when "1111";
				
	D3 <=  mas;
				
	with b(3 downto 0) select
		D4 <= zero when "0000",
				uno  when "0001",
				dos  when "0010",
				tres when "0011",
				quat when "0100",
				qint when "0101",
				sixt when "0110",
				sept when "0111",
				octo when "1000",
				nono when "1001",
				letA when "1010",
				letB when "1011",
				letC when "1100",
				letD when "1101",
				letE when "1110",
				letF when "1111";
				
	with b(7 downto 4) select
		D5 <= zero when "0000",
				uno  when "0001",
				dos  when "0010",
				tres when "0011",
				quat when "0100",
				qint when "0101",
				sixt when "0110",
				sept when "0111",
				octo when "1000",
				nono when "1001",
				letA when "1010",
				letB when "1011",
				letC when "1100",
				letD when "1101",
				letE when "1110",
				letF when "1111";

suma : process(a,b,acarreo)
begin
	acarreo(0)<='0';
	if confirm = '0' then
		for i in 0 to 7 loop
			resultado(i)<=a(i) xor b(i) xor acarreo(i);
			acarreo(i+1)<=(a(i) and b(i))or(acarreo(i) and b(i))or(a(i) and acarreo(i));
		end loop;
	end if;
	resultado(8)<=acarreo(8);
end process;
	
LCD : process(current_state, clk_dly)
	variable contador : Integer range 0 to 9  := 0;     -- Contador para controlar los pulsos en el LCD
	variable contador2: Integer range 0 to 15 := 0;     -- Contador para el mensaje
	variable EN : std_logic := '0';                     -- Para generar pulsos inicializado en 0
	variable numMen : std_logic:='0';
					 
begin
					  
	if clk_dly' event and clk_dly = '1' then	 
		case current_state is					 
		when LCD_INI =>     -- Estado de inicializacion del LCD
			RS <= '0';       -- Modo de comandos
			Datos <= X"38";  -- Estableciendo 8 bits de trabajo, 2 lineas y maxima resolucion
			if contador <	4 then           -- Generacion de 4 pulsos para este comando
				EN := not EN;                -- Negacion de la variable, para generar el pulso
		      E <= EN;                     -- Cambio de valor para EN 
				contador := contador + 1;    -- Incremento del contador una vez
		   else
				contador := 0;               -- Limpia la variable del contador
				next_state <= D_OFF;         -- Salto al estado que apaga el display
         end if;					  
		when D_OFF =>       -- Estado para apagar el LCD
			Datos <= X"08";  -- Comando para apagar el LCD
			if contador < 2 then
				EN := not EN;
		      E <= EN;       -- Cambio de valor para EN 
				contador := contador + 1;    -- Incremento del contador una vez
		   else
				contador := 0;               -- Limpia la variable del contador
				next_state <= LCD_CLR;
         end if;
		when LCD_CLR =>                    -- Estado para limpiar el LCD						  
			Datos <= X"01";                 -- Comando para limpiar el LCD 
			if contador < 2 then            -- Generacion de 2 pulsos para este comando
				EN := not EN;                -- Negacion de la variable, para generar el pulso
		      E <= EN;                     -- Cambio de valor para EN 
				contador := contador + 1;    -- Incremento del contador una vez
		   else
				contador := 0;               -- Limpia la variable del contador
				next_state <= ENTRY;         -- Salto al estado que ajusta el display
         end if;						  									  
		when ENTRY =>        -- Estableciendo movimiento del cursor
								   -- Desplazamiento y modo normal
			Datos <= X"06";   -- Comando de modo de entrada
			if contador < 2 then            -- Generacion de 2 pulsos para este comando
				EN := not EN;                -- Negacion de la variable, para generar el pulso
		      E <= EN;                     -- Cambio de valor para EN 
				contador := contador + 1;    -- Incremento del contador una vez
		   else
				contador := 0;               -- Limpia la variable del contador
				next_state <= D_ON;          -- Salto al estado que activa el display
         end if; 						 									  
		when D_ON =>         -- Estado para encender el LCD
			Datos <= X"0F";                 -- Comando para encender el LCD
			if contador < 2 then            -- Generacion de 2 pulsos para este comando
				EN := not EN;                -- Negacion de la variable, para generar el pulso
		      E <= EN;                     -- Cambio de valor para EN 
				contador := contador + 1;    -- Incremento del contador una vez
		   else
				contador := 0;               -- Limpia la variable del contador
				next_state <= L1;            -- Salto al estado que selecciona la linea 1 del display
         end if;  						  									  
		when L1 =>            -- Seleccion de la linea 1 del LCD				  
			Datos <= X"80";   -- Se establece que se escriba en la linea 1						  
			if contador < 2 then            -- Generacion de 2 pulsos para este comando
				EN := not EN;                -- Negacion de la variable, para generar el pulso
		      E <= EN;                     -- Cambio de valor para EN 
				contador := contador + 1;    -- Incremento del contador una vez
		   else
				contador := 0;               -- Limpia la variable del contador
				next_state <= ASK1;          -- Salto al estado que verifica el estado del SW
         end if; 						  									  
		when ASK1 =>                       -- Verificacion del sw
				RS <= '1';					--LCD en modo de datos
				next_state <= MESG1;		--Pasamos al estado MSG1 para escribir la línea 1
		when MESG1 =>                -- Estado que imprime el mensaje en la linea 1 del LCD						   
			if contador2 < 15 then		         -- Contador para extraer el mensaje					 
					MensajeL1(contador2,numMen,a,Datos);   -- Procedimiento para imprimir mensaje en el LCD
				
				if contador < 2 then          -- Generacion de 2 pulsos para este comando
					EN := not EN;              -- Negacion de la variable, para generar el pulso
		         E <= EN;                   -- Cambio de valor para EN 
					contador := contador + 1;  -- Incremento del contador una vez
		      else
					
					contador := 0;               -- Limpia la variable del contador
					contador2 := contador2 + 1;  -- Incremento del contador2 una vez
					numMen:= not(numMen);
					next_state <= MESG1;          -- Se mantiene aun en el estado MSG1
				end if;
			else
				
				contador2 := 0;               -- Se reinicia el contador 2
				next_state <= L2;             -- Salta al estado para seleccionar la linea 2
			end if;	
		when L2 =>             -- Seleccion de la linea 2 del LCD               
			RS <= '0';        -- LCD en modo de comando 
			Datos <= X"C0";   -- Se establece que se escriba en la linea 1
			if contador < 2 then          -- Generacion de 2 pulsos para este comando
				EN := not EN;                -- Negacion de la variable, para generar el pulso
		      E <= EN;                     -- Cambio de valor para EN 
				contador := contador + 1;    -- Incremento del contador una vez
		   else
				contador := 0;               -- Limpia la variable del contador
				next_state <= ASK2;          -- Salto al estado que verifica el estado del SW
         end if; 									    						    
		when ASK2 =>
				RS <= '1';				--LCD en modo de comandos
				next_state <= MESG2;		--Pasamos a escribir en la línea 2
		when MESG2 =>                -- Estado que imprime el mensaje en la linea 2 del LCD
			if contador2 < 15 then	              -- Contador para extraer el mensaje								 
				MensajeL2(contador2,resultado,Datos);     -- Procedimiento para imprimir mensaje en el LCD
				if contador < 2 then            -- Generacion de 2 pulsos para este comando
					EN := not EN;                -- Negacion de la variable, para generar el pulso
					E <= EN;                     -- Cambio de valor para EN 
					contador := contador + 1;    -- Incremento del contador una vez
				else
					contador := 0;               -- Limpia la variable del contador
					contador2 := contador2 + 1;  -- Incremento del contador2 una vez
					next_state <= MESG2;          -- Se mantiene aun en la maquina de estado
            end if;
			else
				contador2 := 0;                 -- Limpia la variable del contador
				next_state <= ASK3;             -- Salto al estado que verifica el estado del SW
			end if;
		when ASK3 =>				      -- Verificacion del sw			      
			if confirm = '0' then
				RS <= '0'; 
				next_state <= LCD_CLR;
			else 
				next_state <= ASK3;
			end if;
		end case;	                      -- Fin del case
	end if; 							          -- Fin del if que controla el reloj ralentizado
					

end process;

clock : process(clk, clk_dly, clr, count_dly)
begin

	if clr = '0' then
		current_state <= LCD_INI;       -- Que inicie con el estado inicializacion
	elsif (clk' event and clk = '1') then
		if count_dly < base_dly then        -- Control de incremento del contador
			count_dly <= count_dly+1;    -- Incremento del contador para retardo
		else
			current_state <= next_state; --Permite el cambio de estado para el LCD
			clk_dly <= not clk_dly;        -- Generacion de pulsos para el reloj ralentizado
			count_dly <= 0;               -- Reinicio del contador para retardo
		end if;	
	end if;

end process;
	
end architecture;