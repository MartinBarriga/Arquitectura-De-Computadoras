library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageshiftrLR00.all;

entity topshiftrLR00 is
port(
	clk0: inout std_logic;
	cdiv00: in std_logic_vector(4 downto 0);
	reset0: in std_logic;
	ins0: in std_logic_vector(7 downto 0);
	outs0: out std_logic_Vector(7 downto 0));
end topshiftrLR00;

architecture topshiftrLR0 of topshiftrLR00 is
begin 
	SR00: topdiv00 port map(oscout0 => clk0,
							cdiv0 => cdiv00);
	SR01: shiftrLR00 port map(clkrLR => clk0,
							 resetrLR => reset0,
							 inrsrLR => ins0,
							 outrsrLR => outs0);
end topshiftrLR0;