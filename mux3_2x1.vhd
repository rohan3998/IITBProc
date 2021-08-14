--Multiplexer used for 3-bit data

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity mux3_2x1 is
 port(s:in std_logic;a,b:in std_logic_vector(2 downto 0);z:out std_logic_vector(2 downto 0));
end entity;

architecture eqn of mux3_2x1 is
 begin
 


 z <= a when (s='0') else
		b;
		
end eqn;

