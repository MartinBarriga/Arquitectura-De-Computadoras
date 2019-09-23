library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageshiftrLR00 is
	component topdiv00
		port(
		cdiv0: in std_logic_vector(4 downto 0);
		oscout0: inout std_logic);
	end component;
	component shiftrLR00
		port(
		clkrLR: in std_logic;
		inrsrLR: in std_logic_vector(7 downto 0);
		resetrLR: in std_logic;
		outrsrLR: out std_logic_vector(7 downto 0));
	end component;
end packageshiftrLR00;