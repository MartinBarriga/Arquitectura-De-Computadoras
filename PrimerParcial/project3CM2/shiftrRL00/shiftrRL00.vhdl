library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity shiftrRL00 is
	port(
		clkrRL: in std_logic;
		inrsrRL: in std_logic_vector(7 downto 0);
		resetrRL: in std_logic;
		outrsrRL: out std_logic_vector(7 downto 0));
end shiftrRL00;

architecture shiftrRL0 of shiftrRL00 is
signal ssr: std_logic_vector(7 downto 0);
begin
	psr: process(clkrRL)
	begin
		if(clkrRL'event and clkrRL = '1') then
			case resetrRL is
				when '0' => 
					outrsrRL <= (others => '0'); --con esto le digo que llene a outsRL con ceros
					ssr <= inrsrRL;
				when '1' =>
					ssr(0) <= ssr(7);
					ssr(7 downto 1) <= ssr(6 downto 0);
					outrsrRL<= ssr;
				when others => null;
			end case;
		end if;
	end process psr;
end shiftrRL0;