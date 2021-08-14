library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity reg16 is
port(x : in std_logic_vector(15 downto 0); y :out std_logic_vector(15 downto 0); clk: in std_logic);
end entity;

architecture struct of reg16 is
signal t : std_logic_vector(15 downto 0);
begin
y <= t;
process(x,clk)
	variable next_x_var: std_logic_vector(15 downto 0);
	begin
	next_x_var:=x;
		if(clk'event and clk='1') then
			t <= next_x_var;
		
		end if;
end process;
end struct;