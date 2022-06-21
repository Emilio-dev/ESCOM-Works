library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ctrl.all;

entity sync is 
port(

   CLK: in std_logic;
	HSYNC,vSYNC: out std_logic;
	R,G,B: out std_logic_vector(3 downto 0);
	--se agregan los keys--
	KEYS: in std_logic_vector(3 downto 0);
	--creo que esto son los switch
	S : in std_logic_vector(2 downto 0);
	xin1,xin2,yin1,yin2: in std_logic_vector(3 downto 0)
);

end sync;

architecture main of sync is
	type arreglo is array (integer range <>) of integer;
	signal RGB: std_logic_vector(3 downto 0);
	signal DRAWS: std_logic_vector(1688 downto 0);
	signal HPOS: integer range 0 to 1688 :=0;
	signal VPOS: integer range 0 to 1066 :=0;
	signal bandera :std_logic;
	signal dx,dy,sx,sy,err,i,x0,x1,y0,y1,e2,x : integer:=0;
	signal xout,yout :arreglo(0 to 1688); 
begin
	--posicionXY---
	--SQ_X1 <= 1048;
	--SQ_Y1 <= 554;
	--para controlar los cuadritos 
	--se van  a usar cuatro keys y dos switch
	
		process(i,x,dx,dy,sx,sy,err,x0,x1,y0,y1,e2,bandera,xin1,xin2,yin1,yin2) is
		begin
		if bandera = '1'then
				x0<=to_integer(unsigned(xin1));
				x1<=to_integer(unsigned(xin2));
				y0<=to_integer(unsigned(yin1));
				y1<=to_integer(unsigned(yin2));
				dx <= abs(x1-x0);
				dy <= abs(y1-y0);
				if x0 < x1 then 
					sx <= 1; 
				else 
					sx <= -1;
				end if;	
				if y0 < y1 then 
					sy <= 1; 
				else 
					sy <= -1;
				end if;	
				err <= dx-dy;
				for i in 0 to 1688 loop
					xout(i)<=x0;
					yout(i)<=y0;
					if x0 = x1 and y0 = y1 then 
						exit;
					end if;	
					e2 <= 2*err;
					if e2 > -dy then
					err <= err - dy;
					x0 <= x0 + sx;
					end if;
					if e2 < dx then
					err <= err + dx;
					y0 <= y0 + sy;
					end if;
					x<=x+1;
				end loop;	
		
		bandera<='1';
		end if;
	end process;
	process(i) is
	begin
		for i in 0 to x loop
			SQ(HPOS,VPOS,xout(i),yout(i),RGB,DRAWS(i));
		end loop;
	end process;	
	
	process(clk,i)
		begin
			if(clk'event and clk='1')then
			   --si es selecionado el primer cuadrito
				--le da el color rojo
				
				if(DRAWS(0) = '1')then
					if(S(0)='1')then
					
						R <= (OTHERS => '1');
						G <= (OTHERS => '0');
						B <= (OTHERS => '0');
					else
						R <= (OTHERS => '1');
						G <= (OTHERS => '1');
						B <= (OTHERS => '1');
						
					end if;
				end if;
				
				-------------------------------------
			if(DRAWS(0)='0')then
				R <= (OTHERS => '0');
				G <= (OTHERS => '0');
				B <= (OTHERS => '0');
			end if;

		 -------------------------------------
				if(HPOS < 1688)then
					HPOS <= HPOS+1;
				else
				--se necesita actualizar la posicion del cuadrito
				--eso quiere decir que si VPOS pasa a ser 0
				--necesitamos cambiar  la posicion de a cuerdo con las keys
					HPOS <= 0;
					if(VPOS < 1066 )then
						VPOS <= VPOS+1;
					else
					if(s(0) = '1')then
						for i in 0 to x loop
							if(KEYS(0) = '0')then
								xout(i) <= xout(i) + 5;
							end if;
							
							if(KEYS(1) = '0')then
								xout(i) <= xout(i) - 5;
							end if;
							
							if(KEYS(2) = '0')then
								yout(i) <= yout(i) + 5;
							end if;
							
							if(KEYS(3) = '0')then
								yout(i) <= yout(i) - 5;
							end if;
						end loop;	
					end if;
						 	
						VPOS <= 0;
				end if;
				
				end if;
				
				if(HPOS> 48 and HPOS<160)then
					HSYNC <= '0';
					else
						HSYNC <= '1';
				end if;
				
				if(VPOS > 0 and  VPOS < 4)then
					VSYNC <= '0';
					else
						VSYNC <= '1';
				end if;
				
				if((HPOS > 0 and HPOS < 408) or (VPOS > 0 and VPOS < 42))then
					R <= (OTHERS => '0');
					G <= (OTHERS => '0');
					B <= (OTHERS => '0');
					
				end if;
			
			end if;
		end process;
	end main;