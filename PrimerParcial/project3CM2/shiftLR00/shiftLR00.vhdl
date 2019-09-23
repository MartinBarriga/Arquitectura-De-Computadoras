library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity shiftLR00 is
	port(
		clkLR: in std_logic;
		inrsLR: in std_logic_vector(7 downto 0);
		resetLR: in std_logic;
		outrsLR: out std_logic_vector(7 downto 0));
end shiftLR00;

architecture shiftLR0 of shiftLR00 is
signal ssr: std_logic_vector(7 downto 0);
begin
	psr: process(clkLR)
	begin
		if(clkLR'event and clkLR = '1') then
			case resetLR is
				when '0' => 
					outrsLR <= (others => '0'); --con esto le digo que llene a outsRL con ceros
					ssr <= inrsLR;
				when '1' =>
					ssr(7) <= '0';
					ssr(6 downto 0) <= ssr(7 downto 1);
					outrsLR<= ssr;
				when others => null;
			end case;
		end if;
	end process psr;
end shiftLR0;