library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageshiftLR00.all;

entity topshiftLR00 is
port(
	clk0: inout std_logic;
	cdiv00: in std_logic_vector(4 downto 0);
	reset0: in std_logic;
	ins0: in std_logic_vector(7 downto 0);
	outs0: out std_logic_Vector(7 downto 0));
end topshiftLR00;

architecture topshiftLR0 of topshiftLR00 is
begin 
	SR00: topdiv00 port map(oscout0 => clk0,
							cdiv0 => cdiv00);
	SR01: shiftLR00 port map(clkLR => clk0,
							 resetLR => reset0,
							 inrsLR => ins0,
							 outrsLR => outs0);
end topshiftLR0;