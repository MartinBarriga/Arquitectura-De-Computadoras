library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity shiftrLR00 is
	port(
		clkrLR: in std_logic;
		inrsrLR: in std_logic_vector(7 downto 0);
		resetrLR: in std_logic;
		outrsrLR: out std_logic_vector(7 downto 0));
end shiftrLR00;

architecture shiftrLR0 of shiftrLR00 is
signal ssr: std_logic_vector(7 downto 0);
begin
	psr: process(clkrLR)
	begin
		if(clkrLR'event and clkrLR = '1') then
			case resetrLR is
				when '0' => 
					outrsrLR <= (others => '0'); --con esto le digo que llene a outsRL con ceros
					ssr <= inrsrLR;
				when '1' =>
					ssr(7) <= ssr(0);
					ssr(6 downto 0) <= ssr(7 downto 1);
					outrsrLR<= ssr;
				when others => null;
			end case;
		end if;
	end process psr;
end shiftrLR0;