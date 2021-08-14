library ieee;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity IR is
	port (Ir: in std_logic_vector(15 downto 0);
			Ir_en: in std_logic;
			Ir11_9, Ir8_6,Ir5_3: out std_logic_vector(2 downto 0);
			Ir8_0: out std_logic_vector(8 downto 0);
			Ir5_0: out std_logic_vector(5 downto 0));
end entity;

architecture arch of IR is

begin
process(Ir_en, Ir)
begin
if (Ir_en = '1') then
	Ir11_9 <= Ir(11 downto 9);
	Ir8_6  <= Ir(8 downto 6);
	Ir8_0  <= Ir(8 downto 0);
	Ir5_0<=  Ir(5 downto 0);
	Ir5_3 <= Ir (5 downto 3);
end if;
end process;
end arch;