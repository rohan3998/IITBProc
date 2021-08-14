library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity RF is
	port (RF_D3: in std_logic_vector(15 downto 0);
	 RF_A1, RF_A2, RF_A3: in std_logic_vector(2 downto 0); 
	clk,RF_en: in std_logic;
	RF_D1, RF_D2,R7: out std_logic_vector(15 downto 0));
end entity;

architecture arch of RF is 

--signal r0,r1,r2,r3,r4,r5,r6,r7_ip: std_logic_vector(15 downto 0);


type regarray is array(7 downto 0) of std_logic_vector(15 downto 0); 
signal RA: regarray := (0 => x"0000", 1 => x"0000", 2 => x"0000", 3 => x"0000", 4 => x"0000", 5 => x"0000", 6=>x"0000", others => "0000000000000000");
begin
RF_D1 <= RA(conv_integer(RF_A1));
RF_D2 <= RA(conv_integer(RF_A2));
R7 <= RA(7);
process(clk,RF_A1, RF_A2, RF_A3,RF_en)
begin
if(clk'event and clk='1') then
        if(RF_en = '1') then
           RA(conv_integer(RF_A3)) <= RF_D3;	
        end if;
    end if;

end process;
end arch;

	