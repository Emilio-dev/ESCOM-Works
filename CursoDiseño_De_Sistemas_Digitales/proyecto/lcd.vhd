	library ieee;
	use ieee.std_logic_1164.all;
	entity lcd_a is
		port (ent : in std_logic_vector(5 downto 0);
		ent2: in std_logic_vector(1 downto 0);
		ent4,ent3: in std_logic;
		salida:out std_logic_vector(9 downto 0));
	end lcd_a;
	
	architecture lcd of lcd_a is
	begin
		salida<="0100111000"when ent="000010" else
			"0000111000"when ent="000011" else
			"0100001110"when ent="000100" else
			"0000001110"when ent="000101" else
			"0100000110"when ent="000110" else
			"0000000110"when ent="000111" else
			"1100110000"when ent2="00" else --0
			"1000110001"when ent2="01" else --1
			"1100110010"when ent2="10" else --2
			"1000110011"when ent2="11" else --3
			"1101001110"when ent3='1' else --no
			"1001010011"when ent4='1' else --si
			"0100000001"when ent="011011" else --limpiar
			"0000000001"when ent="011100" else --limpiar
			"0000000000";
	end lcd;