	library ieee;
	use ieee.std_logic_1164.all;
	entity lcd_1 is
		port (ent : in std_logic_vector(5 downto 0);
		salida:out std_logic_vector(9 downto 0));
	end lcd_1;
	
	architecture lcd of lcd_1 is
	begin
		salida<="0100111000"when ent="000010" else
			"0000111000"when ent="000011" else
			"0100001110"when ent="000100" else
			"0000001110"when ent="000101" else
			"0100000110"when ent="000110" else
			"0000000110"when ent="000111" else
			"1101000101"when ent="001000" else --E
			"1001001101"when ent="001001" else --M
			"1101001001"when ent="001010" else --I
			"1001001100"when ent="001011" else --L
			"1101001001"when ent="001100" else --I
			"1001001111"when ent="001101" else --O
			"1100100000"when ent="001110" else --espacio
			"1000100000"when ent="001111" else --espacio
			"1101000110"when ent="010000" else --F
			"1001001100"when ent="010001" else --L
			"1001001111"when ent="010010" else --O
			"1001010010"when ent="010011" else --R
			"1101000101"when ent="010100" else --E
			"1001010011"when ent="010101" else --S
			"0111000000"when ent="010110" else --salto de linea
			"0011000000"when ent="010111" else --salto de linea
			"1101000101"when ent="011000" else --E
			"1001001101"when ent="011001" else --M
			"1101001001"when ent="011010" else --I
			"1001001100"when ent="011011" else --L
			"1101001001"when ent="011100" else --I
			"1001001111"when ent="011101" else --O
			"1100100000"when ent="011110" else --espacio
			"1000100000"when ent="111111" else --espacio
			"1101000110"when ent="100000" else --F
			"1001001100"when ent="100001" else --L
			"1001001111"when ent="100010" else --O
			"1001010010"when ent="100011" else --R
			"1101000101"when ent="100100" else --E
			"1001010011"when ent="100101" else --S
			"0100000001"when ent="100110" else --limpiar
			"0000000001"when ent="100111" else --limpiar
			"0000000000";
	end lcd;