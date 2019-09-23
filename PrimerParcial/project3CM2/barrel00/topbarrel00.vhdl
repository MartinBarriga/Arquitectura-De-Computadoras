library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagebarrel00.all;

entity topbarrel00 is
  port(
		sel00: in std_logic_vector( 1 downto 0);
       clk00: inout std_logic;
	   cdiv00: in std_logic_vector(4 downto 0);
	   en0: in  std_logic;
	   ins0: in std_logic_vector(7 downto 0);
	   control0: in std_logic_vector(3 downto 0);
       outs0: out std_logic_vector(7 downto 0));
end topbarrel00;

architecture topbarrel0 of topbarrel00 is
begin

  SRL00: topdiv00 port map(oscout0 => clk00,
                           cdiv0 => cdiv00);
  
  SRL01: barrel00 port map(sel => sel00,
							clks => clk00,
                            enables => en0,
							ins => ins0,
							control => control0,
                            outs => outs0);
end topbarrel0;