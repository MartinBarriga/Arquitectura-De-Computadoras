library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
entity adder4bitLib00 is
	port(
		SL: in std_logic;
		Ai: in std_logic_vector(3 downto 0);
		Bi: in std_logic_vector(3 downto 0);
		So: out std_logic_vector(3 downto 0)
	);
end adder4bitLib00;

architecture adder4bitLib0 of adder4bitLib00 is
signal respuesta: std_logic_vector(3 downto 0);
begin 
	with SL select 
		respuesta <= Ai + Bi when '0',
			         Ai - Bi when others;
	So <= respuesta;
end adder4bitLib0; 