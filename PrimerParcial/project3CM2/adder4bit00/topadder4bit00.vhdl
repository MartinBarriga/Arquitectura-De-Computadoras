library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageadder4bit00.all; 

entity topadder4bit00 is
	port(
		Ai: in std_logic_vector(3 downto 0);
		Bi: in std_logic_vector(3 downto 0);
		SL: in std_logic;
		So: out std_logic_vector(3 downto 0);
		LED: out std_logic
	);
end topadder4bit00;

architecture topadder4bit0 of topadder4bit00 is
	signal SB: std_logic_vector(3 downto 0);
	signal SC: std_logic_vector(3 downto 0);
	signal SA: std_logic_vector(3 downto 0);
	signal SX: std_logic;
begin
end topadder4bit0;