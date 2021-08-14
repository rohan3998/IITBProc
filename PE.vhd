library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity PE is
	port(inp: in std_logic_vector(7 downto 0);
			PE_en: in std_logic;
			outp: out std_logic_vector(2 downto 0);
			PE0: out std_logic;
			new_inp: out std_logic_vector(7 downto 0));
end entity;

architecture arch of PE is
signal outp_temp: std_logic_vector(2 downto 0);
--signal new_input: std_logic_vector(7 downto 0);
signal PE0_temp: std_logic;
begin

	outp <=outp_temp;	PE0 <= PE0_temp;
--new_input <=inp;
	--process(inp)
	--begin
		
			PE0_temp <=not (inp(0) or inp(1) or inp(2) or inp(3) or inp(4) or inp(5) or inp(6) or inp(7));
			--if(inp(0)='1') then
				outp_temp <= "000" when inp(0)='1' else
				--new_input(0) <='0';
				
			--elsif (inp(1) = '1') then
				             "001" when inp(1)='1' else
				--new_input(1)<='0';
				
			--elsif (inp(2) = '1') then
				             "010" when inp(2)='1' else
				--new_inputp(2)<='0';
				
			--elsif (inp(3) = '1') then
				             "011" when inp(3)='1' else
				--inp_temp(3)<='0';
				
			--elsif (inp(4) = '1') then
				             "100" when inp(4)='1' else
				--inp_temp(4)<='0';
				
			--elsif (inp(5) = '1') then
				             "101" when inp(5)='1' else
				--inp_temp(5)<='0';
				
			--elsif (inp(6) = '1') then
				             "110" when inp(6)='1' else
				--inp_temp(6)<='0';
				
			--elsif (inp(7) = '1') then
				             "111";
				--inp_temp(7) <='0';
				
			--	PE0 <='1';
			--end if;
			
			--if(PE_en ='1') then
				new_inp <= inp when PE_en='1' else
				           "00000000";

				
			--end if;
		
	--end process;
end arch;
				