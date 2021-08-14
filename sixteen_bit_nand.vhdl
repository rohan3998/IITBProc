library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity sixteen_bit_nand  is
  port (A: in std_logic_vector(15 downto 0);B : in std_logic_vector(15 downto 0); S: out std_logic_vector(15 downto 0));
end entity sixteen_bit_nand;
architecture Struct of sixteen_bit_nand is

  signal nt : std_logic_vector(15 downto 0);


begin
  -- component instances
genfor: for i in 15 downto 0 generate
S(i) <= not (A(i) and B(i))   ;
 end generate;

end Struct;
