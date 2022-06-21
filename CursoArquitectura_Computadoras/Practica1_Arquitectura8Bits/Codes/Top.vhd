library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity top is
    port(cin : in std_logic_vector(7 downto 0);
		 selector: in std_logic_vector(4 downto 0);
		 selector2: in std_logic_vector(2 downto 0);
		 ins,r_w,clk,clr:in std_logic;
         COUT : out std_logic_vector(7 downto 0);
		 E, RS, RW: out std_logic);
end entity;

architecture arqtop of top is
	component and_gate is
		port(cina : in std_logic_vector(7 downto 0);
			 cinb : in std_logic_vector(7 downto 0);
			 cout : out std_logic_vector(7 downto 0)); 
	end component;
	
	component not_gate is
    port(cina : in std_logic_vector(7 downto 0);          
         cout : out std_logic_vector(7 downto 0)); 
	end component;
	
	component or_gate is
    port(cina : in std_logic_vector(7 downto 0);
		 cinb : in std_logic_vector(7 downto 0);
         cout : out std_logic_vector(7 downto 0)); 
	end component;
	
	component xor_gate is
    port(cina : in std_logic_vector(7 downto 0);
		 cinb : in std_logic_vector(7 downto 0);
         cout : out std_logic_vector(7 downto 0)); 
	end component;
	
	component xnor_gate is
    port(cina : in std_logic_vector(7 downto 0);
		 cinb : in std_logic_vector(7 downto 0);
         cout : out std_logic_vector(7 downto 0)); 
	end component;
		
	component sumador is
		port (aVect : in std_logic_vector (7 downto 0);
			bVect : in std_logic_vector (7 downto 0);
			sVect : out std_logic_vector (7 downto 0));
	end component;
	
	component restador is
		port (aVect : in std_logic_vector (7 downto 0);
        bVect : in std_logic_vector (7 downto 0);
		sVect : out std_logic_vector (7 downto 0));
	end component;
	
	component diferencia is
	port(cina : in std_logic_vector(7 downto 0);
		cinb : in std_logic_vector(7 downto 0);
		cout :out std_logic);
	end component;
	
	component comparador is
	port(cina : in std_logic_vector(7 downto 0);
		cinb : in std_logic_vector(7 downto 0);
		cout :out std_logic);
	end component;

	component shifter is
	port(A: in std_logic;
		selector : in std_logic_vector(2 downto 0);
		I : in std_logic_vector(7 downto 0);
		o :out std_logic_vector(7 downto 0));
	end component;
	
	component m_ram is
	port(r_w,clk,clr: in std_logic;
		selector:in std_logic_vector(2 downto 0);
		I:in std_logic_vector(7 downto 0);
		D: out std_logic_vector(7 downto 0));		
	end component;
	
	component LCD_main is
		Port( clr, clk, sw: in std_logic;
			resultado :in std_logic_vector(7 downto 0);
			selector : in std_logic_vector(4 downto 0);
			Datos: out std_logic_vector(7 downto 0);
			E, RS, RW: out std_logic);		 
	end component;
	
	type res is array (20 downto 0) of std_logic_vector(7 downto 0);
	signal resultado : res;
	signal INA,INB: std_logic_vector(7 downto 0);
	
		begin
		op0: and_gate port map (INA, INB,resultado(0));
		op1: not_gate port map (INA,resultado(1));
		op2: or_gate port map (INA, INB,resultado(2));
		op3: xor_gate port map (INA, INB,resultado(3));
		op4: xnor_gate port map (INA, INB,resultado(4));
		op5: sumador port map (INA, INB,resultado(5));
		op6: restador port map (INA, INB,resultado(6));
		op7: diferencia port map (INA,INB,resultado(7)(0));
		op8: comparador port map (INA, INB,resultado(8)(1));
		op9: shifter port map (r_w,selector2,INA,resultado(9));
		op10: m_ram port map (r_w,clr,clk,selector2,INA,resultado(10));
		LCD: LCD_main port map(clk,clr,r_w,resultado(20),selector,COUT,E,RS,RW);
		--op11: not_gate port map (INA,resultado(1));
		--op12: and_gate port map (INA, INB,resultado(3));
		--op13: and_gate port map (INA, INB,resultado(0));
		--op14: not_gate port map (INA,resultado(1));
		--op15: and_gate port map (INA, INB,resultado(3));
		--op16: and_gate port map (INA, INB,resultado(0));
		--op17: not_gate port map (INA,resultado(1));
		--op18: and_gate port map (INA, INB,resultado(3));
		--op19: and_gate port map (INA, INB,resultado(0));


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
