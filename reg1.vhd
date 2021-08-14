library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity reg1 is
port(x : in std_logic; y :out std_logic; clk,en,rst: in std_logic);
end entity;

architecture struct of reg1 is
signal t : std_logic;
begin
y <= t;
process(en,x,clk,rst)
	variable next_x_var: std_logic;
	begin
	next_x_var:=x;
		if(clk'event and clk='1') then
			if(rst='1') then
			t <= '0';
			elsif(en='1') then
			t <= next_x_var;
			end if;
		end if;
end process;
end struct;