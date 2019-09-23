library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageshiftLR00 is
	component topdiv00
		port(
		cdiv0: in std_logic_vector(4 downto 0);
		oscout0: inout std_logic);
	end component;
	component shiftLR00
		port(
		clkLR: in std_logic;
		inrsLR: in std_logic_vector(7 downto 0);
		resetLR: in std_logic;
		outrsLR: out std_logic_vector(7 downto 0));
	end component;
end packageshiftLR00;