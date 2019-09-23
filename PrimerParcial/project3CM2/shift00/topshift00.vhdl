library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageshift00.all;

entity topshift00 is
port(
	sel0: in std_logic_vector(1 downto 0);
	clk0: inout std_logic;
	cdiv00: in std_logic_vector(4 downto 0);
	reset0: in std_logic;
	ins0: in std_logic_vector(7 downto 0);
	outs0: out std_logic_Vector(7 downto 0));
end topshift00;

architecture topshift0 of topshift00 is
begin 
	SR00: topdiv00 port map(oscout0 => clk0,
							cdiv0 => cdiv00);
	SR01: shift00 port map( sel => sel0,
							 clkLR => clk0,
							 resetLR => reset0,
							 inrsLR => ins0,
							 outrsLR => outs0);
end topshift0;