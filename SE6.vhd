library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity se6 is
 port(a:in std_logic_vector(5 downto 0);z:out std_logic_vector(15 downto 0));
end entity;

architecture eqn of se6 is
begin 
 z(6)<=a(5);z(7)<=a(5);z(8)<=a(5);z(9)<=a(5);z(10)<=a(5);z(11)<=a(5);z(12)<=a(5);z(13)<=a(5);z(14)<=a(5);z(15)<=a(5);
 z(5 downto 0)<=a;
end eqn;