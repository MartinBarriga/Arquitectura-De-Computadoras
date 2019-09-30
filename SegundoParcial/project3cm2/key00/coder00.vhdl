library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		clkc: in std_logic;
		inkeyc: in std_logic_vector(3 downto 0);
		incontc: in std_logic_vector(3 downto 0);
		outcoderc: out std_logic_vector(6 downto 0));
end coder00;

architecture coder0 of coder00 is
signal pressed: std_logic;

begin
	pcoder: process(clkc)
	variable aux: bit:='0';
	begin
		if(clkc'event and clkc = '1') then
			case incontc is
				when "1000" =>
					case inkeyc is
						when "0000" =>
							pressed <= '0';
							aux := '0';
						when "0001" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								pressed <= '1';
								outcoderc <= "0110000"; -- 1
							end if;
						when "0010" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc <= "1101101"; -- 2
							end if;	
						when "0100" =>
							if((aux = '0' and pressed = '0')then
								aux:='1';
								outcoderc <= "1111001"; -- 3
							end if;
						when "1000" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc  <= "1110111"; -- A
							end if;	
						when others => null;
					end case;
	-------------------------------------------------------------------------------
				when "0100" =>
					case inkeyc is
						when "0000" =>
							aux := '0';
						when "0001" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc <= "0110011"; -- 4
							end if;
						when "0010" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc <= "1011011"; -- 5
							end if;	
						when "0100" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc <= "1011111"; -- 6
							end if;
						when "1000" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc  <= "0011111"; -- A
							end if;	
						when others => null;
					end case;
	-------------------------------------------------------------------------------
				when "0010" =>
					case inkeyc is
						when "0000" =>
							aux := '0';
						when "0001" =>
							if(aux = '0' and pressed = '0')then
								aux:='1';
								outcoderc <= "1110000"; -- 7
							end if;
						when "0010" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc <= "1111111"; -- 8
							end if;	
						when "0100" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc <= "1110011"; -- 9
							end if;
						when "1000" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc  <= "1001110"; -- C
							end if;	
						when others => null;
					end case;	
	-------------------------------------------------------------------------------
				when "0001" =>
					case inkeyc is
						when "0000" =>
							aux := '0';
						when "0001" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc <= "1100011" ; -- *
							end if;
						when "0010" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc <= "1111110"; -- 0
							end if;	
						when "0100" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc <= "0011101"; -- +
							end if;
						when "1000" =>
							if(aux = '0' and pressed = '0') then
								aux:='1';
								outcoderc  <= "0000001"; -- -
							end if;	
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process pcoder;
end coder0;