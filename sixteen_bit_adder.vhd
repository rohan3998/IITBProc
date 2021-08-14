library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity sixteen_bit_adder  is
  port (A: in std_logic_vector(15 downto 0);B : in std_logic_vector(15 downto 0);  S: out std_logic_vector(15 downto 0); Cout :out std_logic);
end entity sixteen_bit_adder;
architecture Struct of sixteen_bit_adder is

  signal tC1,tC2,tC3,tC4,tC5,tC6,tC7,tC8,tC9,tC10,tC11,tC12,tC13,tC14,tC15: std_logic;
component Full_Adder  is
  port (A, B, Cin: in std_logic; S, Cout: out std_logic);
end component;

begin
  -- component instances
  fa0: Full_Adder 
       port map (A => A(0), B => B(0), Cin => '0', Cout => tC1,S => S(0));
  fa1: Full_Adder 
       port map (A => A(1), B => B(1), Cin => tC1, Cout => tC2,S => S(1));
  fa2: Full_Adder 
       port map (A => A(2), B => B(2), Cin => tC2, Cout => tC3,S => S(2));
  fa3: Full_Adder 
       port map (A => A(3), B => B(3), Cin => tC3, Cout => tC4,S => S(3));
  fa4: Full_Adder 
       port map (A => A(4), B => B(4), Cin => tC4, Cout => tC5,S => S(4));
  fa5: Full_Adder 
       port map (A => A(5), B => B(5), Cin => tC5, Cout => tC6,S => S(5));
  fa6: Full_Adder 
       port map (A => A(6), B => B(6), Cin => tC6, Cout => tC7,S => S(6));
  fa7: Full_Adder 
       port map (A => A(7), B => B(7), Cin => tC7, Cout => tC8,S => S(7));
  fa8: Full_Adder 
       port map (A => A(8), B => B(8), Cin => tC8, Cout => tC9 ,S => S(8));
  fa9: Full_Adder 
       port map (A => A(9), B => B(9), Cin => tC9, Cout => tC10 ,S => S(9));
  fa10: Full_Adder 
       port map (A => A(10), B => B(10), Cin => tC10, Cout => tC11 ,S => S(10));
  fa11: Full_Adder 
       port map (A => A(11), B => B(11), Cin => tC11, Cout => tC12 ,S => S(11));
  fa12: Full_Adder 
       port map (A => A(12), B => B(12), Cin => tC12, Cout => tC13 ,S => S(12));
  fa13: Full_Adder 
       port map (A => A(13), B => B(13), Cin => tC13, Cout => tC14 ,S => S(13));
  fa14: Full_Adder 
       port map (A => A(14), B => B(14), Cin => tC14, Cout => tC15 ,S => S(14));
  fa15: Full_Adder 
       port map (A => A(15), B => B(15), Cin => tC15, Cout => Cout ,S => S(15));


end Struct;