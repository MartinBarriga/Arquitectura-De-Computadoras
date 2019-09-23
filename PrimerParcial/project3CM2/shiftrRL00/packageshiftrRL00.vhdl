library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageshiftrRL00 is
	component topdiv00
		port(
		cdiv0: in std_logic_vector(4 downto 0);
		oscout0: inout std_logic);
	end component;
	component shiftrRL00
		port(
		clkrRL: in std_logic;
		inrsrRL: in std_logic_vector(7 downto 0);
		resetrRL: in std_logic;
		outrsrRL: out std_logic_vector(7 downto 0));
	end component;
end packageshiftrRL00;