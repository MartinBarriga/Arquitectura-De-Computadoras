library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity shift00 is
	port(
		sel: in std_logic_vector(1 downto 0);
		clkLR: in std_logic;
		inrsLR: in std_logic_vector(7 downto 0);
		resetLR: in std_logic;
		outrsLR: out std_logic_vector(7 downto 0));
end shift00;

architecture shift0 of shift00 is
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
					if(sel = "00") then -- LR
						ssr(7) <= '0';
						ssr(6 downto 0) <= ssr(7 downto 1);
						
					elsif(sel = "01") then -- RL
						ssr(0) <= '0';
						ssr(7 downto 1) <= ssr(6 downto 0);
						
					elsif(sel = "11") then --rLR
						ssr(7) <= ssr(0);
						ssr(6 downto 0) <= ssr(7 downto 1);
						
					else --rRL
						ssr(0) <= ssr(7);
						ssr(7 downto 1) <= ssr(6 downto 0);
					end if;
					
					outrsLR<= ssr;

					
				when others => null;
			end case;
		end if;
	end process psr;
end shift0;