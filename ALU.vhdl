library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity ALU is 
port(ALU_A, ALU_B : in std_logic_vector(15 downto 0); ALU_C : out std_logic_vector(15 downto 0); clk,ALU_en:in std_logic; oprd :in std_logic_vector(3 downto 0); ALU_cr, ALU_z:out std_logic) ;
end entity;

architecture struct of ALU is

component sixteen_bit_adder is
  port (A: in std_logic_vector(15 downto 0);B : in std_logic_vector(15 downto 0); S: out std_logic_vector(15 downto 0); Cout: out std_logic);
end component;

component sixteen_bit_nand  is
  port (A: in std_logic_vector(15 downto 0);B : in std_logic_vector(15 downto 0); S: out std_logic_vector(15 downto 0));
end component;

-- 00 : add
-- 01 : nand
-- 10 : aic

signal t1,t2 : std_logic_vector(15 downto 0);
signal z1,c1,ALU_op: std_logic;

begin
   

	o1 : sixteen_bit_adder port map(ALU_A, ALU_B, t1, c1);
	
	o2 : sixteen_bit_nand port map(ALU_A, ALU_B, t2);

ALU_op <= (not oprd(3)) and (not oprd(2)) and (not oprd(0)) and oprd(1);

 ALU_C<= t1 when ( ALU_op = '0')else
         t2;
			
		
		
z1 <= not(t1(0) or t1(1) or t1(2) or t1(3) or t1(4) or t1(5) or t1(6) or t1(7) or t1(8) or t1(9) or t1(10) or t1(11) or t1(12) or t1(13) or t1(14) or t1(15)) when (ALU_op = '0')else
			not(t2(0) or t2(1) or t2(2) or t2(3) or t2(4) or t2(5) or t2(6) or t2(7) or t2(8) or t2(9) or t2(10) or t2(11) or t2(12) or t2(13) or t2(14) or t2(15));
			
process(clk,ALU_en,ALU_op,c1)
begin
if(clk'event and clk='1') then
        if(ALU_en = '1') then
           if(ALU_op = '0') then
			     if(oprd = "0000" or oprd = "0001" or oprd = "0010")then              
						ALU_cr <= c1 ;
		        end if;
		
					ALU_z <= z1;
					
				else
					ALU_z <= z1;
				 end if;
      end if;
   end if;
end process ; 			

end struct;