library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity LS7 is
 port(a:in std_logic_vector(8 downto 0);z:out std_logic_vector(15 downto 0));
end entity;

architecture eqn of LS7 is
begin 
 z(6 downto 0) <= "0000000";
 z(15 downto 7)<=a;
end eqn;