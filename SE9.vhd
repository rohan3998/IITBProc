library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity se9 is
 port(a:in std_logic_vector(8 downto 0);z:out std_logic_vector(15 downto 0));
end entity;

architecture eqn of se9 is
begin 

 z(9)<=a(8);z(10)<=a(8);z(11)<=a(8);z(12)<=a(8);z(13)<=a(8);z(14)<=a(8);z(15)<=a(8); 
 z(8 downto 0)<=a ;


end eqn;