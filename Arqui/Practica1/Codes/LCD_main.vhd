
    -- Programa para el manejo del LCD
	 -- Elaborado por: U581
	 -- Fecha: 7 de diciembre de 2021
	 
	 -- ---------------------------------------
	 --      Declaracion de las bibliotecas
	 -- ---------------------------------------
	 
Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
			  			  
	 -- ---------------------------------------
	 --      Declaracion de la entidad
	 -- ---------------------------------------
	  
entity LCD_main is
		Port( clr, clk, sw: in std_logic;
			resultado :in std_logic_vector(7 downto 0);
			selector : in std_logic_vector(4 downto 0);
			Datos: out std_logic_vector(7 downto 0);
			E, RS, RW: out std_logic);		 
end LCD_main;	  
	 -- --------------------------------------
	 --     Declaracion de la arquitectura
	 -- --------------------------------------
architecture behaviour of LCD_main is	

	component LCD_decrypter is
		port(u:in integer range 0 to 15;
			op:in std_logic_vector(4 downto 0);
			 data: in std_logic_vector(7 downto 0);
			 datares,dataop: out std_logic_vector(7 downto 0));
	end component;
	---------------------------------------
	--Declaracion de constantes y señales
	---------------------------------------
	constant base_dly    : Integer := 1000000; 		    -- Constante para 50Hz
	signal countdly    : INTEGER range 0 to base_dly;  -- Señal para retardo
	signal clkdly   : std_logic;                       -- Reloj ya ralentizado 			 			 			  			 			 
	type state is (LCD_INI, D_OFF, LCD_CLR, D_ON, ENTRY, ASK1, MSG1, MSG2, ASK2, ASK3, L1, L2);    -- Tipo para creacion de estados    
	signal current_state, next_state: state;    -- señales tipo estado
	signal data1,data2: std_logic_vector(7 downto 0);	
	signal contador2: Integer range 0 to 15 := 0;	
	
begin
	mensaje: LCD_decrypter port map (contador2,selector,resultado,data1,data2);
	RW <= '0';    -- Como no se usa la lectura, esta salida se pone en 0
	-- -------------------------------------
	--      Declaracion de los estados
	-- -------------------------------------
EDOS:		    process(current_state,clkdly)
			       
					  variable contador : Integer range 0 to 9  := 0;     -- Contador para controlar los pulsos en el LCD
					  variable EN : std_logic := '0';                     -- Para generar pulsos inicializado en 0
					 
		           begin
					  
					    if clkdly' event and clkdly = '1' then 
						 
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
								  
								     if sw = '0' then                
									     next_state <= ASK1;          -- Si el sw esta en 0, esperar
								     else
									     RS <= '1';                   -- LCD en modo de datos
									     next_state <= MSG1;          -- De lo contrario pasar al estado MSG1
									  end if;
									  
								  when MSG1 =>                -- Estado que imprime el mensaje en la linea 1 del LCD
								   
								       if contador2 < 15 then		         -- Contador para extraer el mensaje					 
										    Datos<=data1;   -- Procedimiento para imprimir mensaje en el LCD
											   if contador < 2 then          -- Generacion de 2 pulsos para este comando
						                     EN := not EN;              -- Negacion de la variable, para generar el pulso
		                                 E <= EN;                   -- Cambio de valor para EN 
							                  contador := contador + 1;  -- Incremento del contador una vez
		                              else
						                     contador := 0;               -- Limpia la variable del contador
													contador2 <= contador2 + 1;  -- Incremento del contador2 una vez
										         next_state <= MSG1;          -- Se mantiene aun en el estado MSG1
                                    end if;
										 else
									         contador2 <= 0;               -- Se reinicia el contador 2
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
								 
								  when ASK2 =>                -- Verificacion del sw
								  
								     if sw = '0' then         -- Si el sw esta en 0
									     RS <= '1';            -- LCD en modo de datos
									     next_state <= MSG2;   -- Salto al estado MGS2
								     else									     
									     next_state <= ASK2;   -- De lo contrario esperar en este estado
									  end if;
								  
								  when MSG2 =>                -- Estado que imprime el mensaje en la linea 2 del LCD
								  
								      if contador2 < 15 then	              -- Contador para extraer el mensaje								 
										    Datos<=data2;     -- Procedimiento para imprimir mensaje en el LCD
											   if contador < 2 then            -- Generacion de 2 pulsos para este comando
						                     EN := not EN;                -- Negacion de la variable, para generar el pulso
		                                 E <= EN;                     -- Cambio de valor para EN 
							                  contador := contador + 1;    -- Incremento del contador una vez
		                              else
						                     contador := 0;               -- Limpia la variable del contador
													contador2 <= contador2 + 1;  -- Incremento del contador2 una vez
										         next_state <= MSG2;          -- Se mantiene aun en la maquina de estado
                                    end if;
										 else
									         contador2 <= 0;                 -- Limpia la variable del contador
										      next_state <= ASK3;             -- Salto al estado que verifica el estado del SW
										 end if;
										 
								  when ASK3 =>				      -- Verificacion del sw			      
										
									  if sw = '0' then 
									     next_state <= ASK3;   -- Si el sw esta en 0, esperar
								     else									     
									     RS <= '0';               -- LCD en modo de comandos
										  next_state <= LCD_CLR;   -- De lo contrario pasar al estado que limpia el Display
									  end if;
								  
							 end case;	                      -- Fin del case

                 end if; 							          -- Fin del if que controla el reloj ralentizado
					 
			    end process;		                         -- Fin del proceso
			 
				  
				  
   -- ------------------------------------------------------
	--        Proceso para saltar de estado en estado
	-- ------------------------------------------------------		  
			  
			  
Clock:      process(next_state, countdly, clk, clkdly, clr)
              
             begin
				 
					 if clr = '0' then                  -- Si hay un reset
					 
						 current_state <= LCD_INI;       -- Que inicie con el estado inicializacion    
						 
					 elsif (clk' event and clk = '1') then  -- Control del reloj (50MHz))
						 
						  if countdly < base_dly then        -- Control de incremento del contador
						          countdly <= countdly+1;    -- Incremento del contador para retardo
				        else
								 	 current_state <= next_state; -- Salto de estado
									 clkdly <= not clkdly;        -- Generacion de pulsos para el reloj ralentizado
									 countdly <= 0;               -- Reinicio del contador para retardo
				        end if;	
									 
					 end if;

            end process;
 end behaviour;