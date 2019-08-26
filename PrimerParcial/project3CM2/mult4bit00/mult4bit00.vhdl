library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagemult4bit00.all;

entity mult4bit00 is 
	port(
		Ami: in std_logic_vector(3 downto 0);
		Bmi: in std_logic_vector(3 downto 0);
		Rmo: out std_logic_vector(7 downto 0)
		);
		
end mult4bit00;

architecture mult4bit0 of mult4bit00 is

signal S0: std_logic_vector(2 downto 0);
signal S1: std_logic_vector(3 downto 0);
signal S2: std_logic_vector(3 downto 0);
signal S3: std_logic_vector(2 downto 0);
signal S4: std_logic_vector(3 downto 0);
signal S5: std_logic_vector(3 downto 0);
signal S6: std_logic_vector(2 downto 0);
signal S7: std_logic_vector(3 downto 0);
signal S8: std_logic_vector(2 downto 0);

begin
	MU00: and00 port map(  Aa => Ami(0),
							Ba => Bmi(0),
							Ya => Rmo(0));
							
	MU01: and00 port map(  Aa => Ami(1),
							Ba => Bmi(0),
							Ya => S0(0));
							
	MU02: and00 port map(  Aa => Ami(2),
							Ba => Bmi(0),
							Ya => S0(1));		
									
	MU03: and00 port map(  Aa => Ami(3),
							Ba => Bmi(0),
							Ya => S0(2));	
							
	MU04: and00 port map(  Aa => Ami(0),
							Ba => Bmi(1),
							Ya => S1(0));	
	
	MU05: and00 port map(Aa => Ami(1),
						  Ba => Bmi(1),
						  Ya => S1(1));

	MU06: and00 port map(Aa => Ami(2),
						  Ba => Bmi(1),
						  Ya => S1(2));	
							
	MU07: and00 port map(Aa => Ami(3),
						  Ba => Bmi(1),
						  Ya => S1(3));
	
	MU08: fa00 port map(C00 => '0',
						 A00 => S0(0),
						 B00 => S1(0),
						 C01 => S2(0),
						 S00 => Rmo(1));
	
	
end mult4bit0;