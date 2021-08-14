-- Multiplexer used for 16-bit data
-- 4x1 mux

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity mux16_4x1 is
 port(s:in std_logic_vector(1 downto 0);a,b,c,d:in std_logic_vector(15 downto 0);z:out std_logic_vector(15 downto 0));
end entity;

architecture eqn of mux16_4x1 is
begin 


 z <= a when (s="00") else
		b when (s="01") else
		c when (s="10") else
		d;
		
end eqn;
