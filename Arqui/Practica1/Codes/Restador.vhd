library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	

entity restador is
  port (aVect : in std_logic_vector (7 downto 0);
        bVect : in std_logic_vector (7 downto 0);
		sVect : out std_logic_vector (7 downto 0));
end entity restador;

architecture arq_restador of restador is

    component restador_unbit is
        port (
            rest, carryOut : out std_logic;
            a, b, carryIn : in std_logic
        );
    end component;
	signal carryOut :std_logic;
    signal auxCarry : std_logic_vector (8 downto 0);

begin

     auxCarry(0) <= '0';

    bit_s0: restador_unbit port map (
        rest => sVect(0),
        carryOut => auxCarry(1),
        a => aVect(0),
        b => bVect(0),
        carryIn => auxCarry(0)
    );

    bit_s1: restador_unbit port map (
        rest => sVect(1),
        carryOut => auxCarry(2),
        a => aVect(1),
        b => bVect(1),
        carryIn => auxCarry(1)
    );

    bit_s2: restador_unbit port map (
        rest => sVect(2),
        carryOut => auxCarry(3),
        a => aVect(2),
        b => bVect(2),
        carryIn => auxCarry(2)
    );

    bit_s3: restador_unbit port map (
        rest => sVect(3),
        carryOut => auxCarry(4),
        a => aVect(3),
        b => bVect(3),
        carryIn => auxCarry(3)
    );
	
	bit_s4: restador_unbit port map (
        rest => sVect(4),
        carryOut => auxCarry(5),
        a => aVect(4),
        b => bVect(4),
        carryIn => auxCarry(4)
    );

    bit_s5: restador_unbit port map (
        rest => sVect(5),
        carryOut => auxCarry(6),
        a => aVect(5),
        b => bVect(5),
        carryIn => auxCarry(5)
    );

    bit_s6: restador_unbit port map (
        rest => sVect(6),
        carryOut => auxCarry(7),
        a => aVect(6),
        b => bVect(6),
        carryIn => auxCarry(6)
    );

    bit_s7: restador_unbit port map (
        rest => sVect(7),
        carryOut => auxCarry(8),
        a => aVect(7),
        b => bVect(7),
        carryIn => auxCarry(7)
    );
	
	carryOut <= auxCarry(8);
end architecture;