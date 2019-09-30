library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		clkc: in std_logic;
		inkeyc: in std_logic_vector(3 downto 0);
		resetc: in std_logic;
		incontc: in std_logic_vector(3 downto 0);
		outwordc: out std_logic_vector(6 downto 0);
		outcontc: inout std_logic_vector(4 downto 0);
		outFlagc: out std_logic);
end coder00;

architecture coder0 of coder00 is 
begin
	pcoder: process(clkc) 
	variable aux1: bit:= '0';
	variable aux2: bit:= '0';
	variable aux3: bit:= '0';
	variable aux4: bit:= '0';
	begin
		if(clkc'event and clkc = '1') then
			case resetc is
				when '0' => 
					outcontc <= (others => '0');
					outwordc <= (others => '0');
					outFlagc <= '0';
				when '1' =>
					case incontc is
						when "1000" =>
							case inkeyc is
								when "0000" =>
									aux1:='0';
									aux2:='0';
									aux3:='0';
									aux4:='0';
									outcontc <= outcontc;
								when "0001" =>
									if(aux1 = '0') then 
										aux1:= '1';
										outwordc <= "0110000"; --1
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
----------------------------------------------------------------------------------------
								when "0010" =>
									if(aux1 = '0') then 
										aux1:= '1';
										outwordc <= "1101101"; --2
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
------------------------------------------------------------------------------------									
								when "0100" =>
									if(aux1 = '0') then 
										aux1:= '1';
										outwordc <= "1111001"; --3
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
--------------------------------------------------------------------------------------
								when "1000" =>
									if(aux1 = '0') then 
										aux1:= '1';
										outwordc <= "1110111"; --A
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
---------------------------------------------------------------------------------------
								when others => null;
							end case;
--************************************************************************************--
						when "0100" =>
							case inkeyc is
								when "0000" =>
									aux1:='0';
									aux2:='0';
									aux3:='0';
									aux4:='0';
									outcontc <= outcontc;
								when "0001" =>
									if(aux2 = '0') then 
										aux2:= '1';
										outwordc <= "0110011"; --4
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
----------------------------------------------------------------------------------------
								when "0010" =>
									if(aux2 = '0') then 
										aux2:= '1';
										outwordc <= "1011011"; --5
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
------------------------------------------------------------------------------------									
								when "0100" =>
									if(aux2 = '0') then 
										aux2:= '1';
										outwordc <= "1011111"; --6
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
--------------------------------------------------------------------------------------
								when "1000" =>
									if(aux2 = '0') then 
										aux2:= '1';
										outwordc <= "0011111"; --b
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
---------------------------------------------------------------------------------------
								when others => null;
							end case;
--************************************************************************************--
						when "0010" =>
							case inkeyc is
								when "0000" =>
									aux1:='0';
									aux2:='0';
									aux3:='0';
									aux4:='0';
									outcontc <= outcontc;
								when "0001" =>
									if(aux3 = '0') then 
										aux3:= '1';
										outwordc <= "1111110"; --0
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
----------------------------------------------------------------------------------------
								when "0010" =>
									if(aux3 = '0') then 
										aux3:= '1';
										outwordc <= "1100011"; --*
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
------------------------------------------------------------------------------------									
								when "0100" =>
									if(aux3 = '0') then 
										aux3:= '1';
										outwordc <= "0011101"; --+
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
--------------------------------------------------------------------------------------
								when "1000" =>
									if(aux3 = '0') then 
										aux3:= '1';
										outwordc <= "0000001"; -- -
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
---------------------------------------------------------------------------------------
								when others => null;
							end case;
--************************************************************************************--
						when "0001" =>
							case inkeyc is
								when "0000" =>
									aux1:='0';
									aux2:='0';
									aux3:='0';
									aux4:='0';
									outcontc <= outcontc;
								when "0001" =>
									if(aux4 = '0') then 
										aux4:= '1';
										outwordc <= "1110000"; --7
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
----------------------------------------------------------------------------------------
								when "0010" =>
									if(aux4 = '0') then 
										aux4:= '1';
										outwordc <= "1111111"; --8
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
------------------------------------------------------------------------------------									
								when "0100" =>
									if(aux4 = '0') then 
										aux4:= '1';
										outwordc <= "1110011"; --9
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
--------------------------------------------------------------------------------------
								when "1000" =>
									if(aux4 = '0') then 
										aux4:= '1';
										outwordc <= "1001111"; --c
										outcontc <= outcontc + '1';
										outFlagc <= '1';
									else 
										outcontc <= outcontc;
										outFlagc <= '0';
									end if;
---------------------------------------------------------------------------------------
								when others => null;
							end case;
--************************************************************************************--
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process pcoder;
end coder0;