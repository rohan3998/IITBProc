-- Multiplexer used for 16-bit data
-- 4x1 mux

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity mux16_9x1 is
 port(s:in std_logic_vector(3 downto 0);a,b,c,d,e,f,g:in std_logic_vector(15 downto 0);z:out std_logic_vector(15 downto 0));
end entity;

architecture eqn of mux16_9x1 is
 begin
 

 z<= a when (s="0000") else
	 b when (s="0001") else
	 c when (s="0010") else
	 d when (s="0011") else
	 e when (s="0100") else
	 f when (s="0101") else
	 g when (s="0110") else
	 a;
	 
end eqn;
