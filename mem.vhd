library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;


entity mem is 
	port (address_1,address_2,Mem_datain_2: in std_logic_vector(15 downto 0);  Mem_wrbar_2: in std_logic;
				Mem_dataout_1,Mem_dataout_2: out std_logic_vector(15 downto 0));
end entity;

architecture Form of mem is 
type regarray is array(65535 downto 0) of std_logic_vector(15 downto 0);   -- defining a new type
signal Memory: regarray:=(
--0 => x"C285",
--0=>x"8208",
0=> x"4288",
1=> x"4648",
2=> x"4842",
3=> x"08E8",
4=> x"1D03",
5=> x"8003",
8=> x"35E0",
9=> x"C700",
--1=>x"08E8",
--8=>x"0298",
--9=>x"98C0",
--1 =>  "0001101101010000",
--2 =>  "0000000000000000",
--3 =>  "0000001001001000",
--4 =>  "0100100101000000",
--16 =>  "1010101010101010",
others => "1111000000000000"
);


begin
Mem_dataout_1 <= Memory(conv_integer(address_1));
Mem_dataout_2 <= Memory(conv_integer(address_2));
process (address_1,Mem_wrbar_2,Mem_datain_2,address_2)
	begin
	if(Mem_wrbar_2 = '0') then
		
			Memory(conv_integer(address_2)) <= Mem_datain_2;
		
	end if;
	end process;
end Form;