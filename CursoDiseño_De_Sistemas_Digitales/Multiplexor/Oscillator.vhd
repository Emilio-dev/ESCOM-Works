library ieee;
use ieee.std_logic_1164.all;
--library lattice;
--use lattice.components.all;
--library machx02;
--use machx02.all;

entity osc00 is
	port(
		  osc_int0: inout std_logic);
end osc00;
		  

architecture osc0 of osc00 is
COMPONENT OSCH
GENERIC (NOM_FREQ: string := "2.08");
		 PORT (STDBY: in std_logic;
				osc: out std_logic);
END COMPONENT;
attribute NOM_FREQ : string;
attribute NOM_FREQ of OSCinst0 : label is "2.08";
begin
	OSCInst0: OSCH
GENERIC MAP( NOM_FREQ => "2.08" )		PORT MAP (STDBY=> '0',
					osc => osc_int0);
end osc0;					

