library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity comparator is
	port(inp1,inp2: in std_logic_vector(15 downto 0);
			comp_en: in std_logic;
			output: out std_logic);
end entity;

architecture arch of comparator is
	begin
--	process(comp_en)
		--begin
		--if(inp1=inp2) then
			output <= '1' when inp1=inp2 and comp_en='1' else
		--else
			        '0';
		--end if;
	--end process;
end arch;
	