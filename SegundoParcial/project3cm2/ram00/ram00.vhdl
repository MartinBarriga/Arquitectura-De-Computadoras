library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
library lattice;
use lattice.all;

entity ram00 is
	port(
		clkmra: in std_logic;
		resetmra: in std_logic;
		rwmra: in std_logic;
		indirWmra: in std_logic_vector(4 downto 0);
		indirRmra: in std_logic_vector(4 downto 0);
		inwordmra: in std_logic_vector(6 downto 0);
		inFlagmra: in std_logic;
		outwordmra: out std_logic_vector(6 downto 0));
end ram00;

architecture ram0 of ram00 is
type arrayram is array(0 to 63) of std_logic_vector(6 downto 0);
signal wordram: arrayram;
signal scontrolm: std_logic_vector(1 downto 0);
begin
	scontrolm <= (resetmra)&(rwmra);
	pram: process(clkmra)
	begin
		if(clkmra'event and clkmra = '1') then 
			case scontrolm is
				when "10" =>
					if(inFlagmra = '1') then
						wordram(conv_integer(indirWmra)) <= inwordmra;
					end if;
				when "11" =>
					outwordmra <= wordram(conv_integer(indirRmra));
				when others => null;
			end case;
		end if;
	end process pram;
end ram0;