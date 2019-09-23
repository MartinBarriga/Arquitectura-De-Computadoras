library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageshift00 is
	component topdiv00
		port(
		cdiv0: in std_logic_vector(4 downto 0);
		oscout0: inout std_logic);
	end component;
	component shift00
		port(
		sel: in std_logic_vector(1 downto 0);
		clkLR: in std_logic;
		inrsLR: in std_logic_vector(7 downto 0);
		resetLR: in std_logic;
		outrsLR: out std_logic_vector(7 downto 0));
	end component;
end packageshift00;